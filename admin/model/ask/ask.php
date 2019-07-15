<?php
class ModelAskAsk extends Model {
	public function addAsk($data) {
		if (!empty($data['download'])) {
			foreach ($data['download'] as $key => $value) {
				$sort[$key] = $value['order'];
			}
			
			array_multisort($sort,SORT_DESC,$data['download']);
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "ask SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status']. "', download = '" . serialize($data['download']). "', year = '" . $data['year']. "', ask_type_id = '" . (int)$data['ask_type_id'] . "'");

		$ask_id = $this->db->getLastId(); 

		foreach ($data['ask_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "ask_description SET ask_id = '" . (int)$ask_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['ask_store'])) {
			foreach ($data['ask_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "ask_to_store SET ask_id = '" . (int)$ask_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
 
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'ask_id=" . (int)$ask_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('ask');
	}

	public function editAsk($ask_id, $data) {
		if (!empty($data['download'])) {
			foreach ($data['download'] as $key => $value) {
				$sort[$key] = $value['order'];
			}
			
			array_multisort($sort,SORT_DESC,$data['download']);
		}
		$this->db->query("UPDATE " . DB_PREFIX . "ask SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status']. "', ask_type_id = '" . (int)$data['ask_type_id']  . "', download = '" . serialize($data['download'])  . "', year = '" . $data['year']  . "' WHERE ask_id = '" . (int)$ask_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_description WHERE ask_id = '" . (int)$ask_id . "'");

		foreach ($data['ask_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "ask_description SET ask_id = '" . (int)$ask_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_to_store WHERE ask_id = '" . (int)$ask_id . "'");

		if (isset($data['ask_store'])) {
			foreach ($data['ask_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "ask_to_store SET ask_id = '" . (int)$ask_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

 
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'ask_id=" . (int)$ask_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'ask_id=" . (int)$ask_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('ask');
	}

	public function deleteAsk($ask_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask WHERE ask_id = '" . (int)$ask_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_description WHERE ask_id = '" . (int)$ask_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_to_store WHERE ask_id = '" . (int)$ask_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_to_layout WHERE ask_id = '" . (int)$ask_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'ask_id=" . (int)$ask_id . "'");

		$this->cache->delete('ask');
	}	

	public function getAsk($ask_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'ask_id=" . (int)$ask_id . "') AS keyword FROM " . DB_PREFIX . "ask WHERE ask_id = '" . (int)$ask_id . "'");

		return $query->row;
	}

	public function getAsks($data = array()) {
 			$sql = "SELECT i.* ,id.*,atd.title as ask_type FROM " . DB_PREFIX . "ask i LEFT JOIN " . DB_PREFIX . "ask_description id ON (i.ask_id = id.ask_id) LEFT JOIN " . DB_PREFIX . "ask_type_description atd ON (i.ask_type_id = atd.ask_type_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'  and atd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.title',
				'i.sort_order'
			);		
			if (isset($data['ask_type_id']) && !is_null($data['ask_type_id'])) {
				$sql .= " AND i.ask_type_id = '" . (int)$data['ask_type_id'] . "'";
			}
			if (isset($data['filter_title']) && !is_null($data['filter_title'])) {
				$sql .= " AND id.title like '%" . $data['filter_title'] . "%'";
			}
			if (isset($data['filter_year']) && !is_null($data['filter_year'])) {
				$sql .= " AND i.year = '" . $data['filter_year'] . "'";
			}

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY i.year" ;	
			} else {
				$sql .= " ORDER BY i.year";	
			}

			if (isset($data['order']) && ($data['order'] == 'ASC')) {
				$sql .= " DESC";
			} else {
				$sql .= " DESC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
 			
			$query = $this->db->query($sql);

			return $query->rows;
 	}
 	
	public function getAskDescriptions($ask_id) {
		$ask_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ask_description WHERE ask_id = '" . (int)$ask_id . "'");

		foreach ($query->rows as $result) {
			$ask_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'description' => $result['description']
			);
		}

		return $ask_description_data;
	}

	public function getAskStores($ask_id) {
		$ask_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ask_to_store WHERE ask_id = '" . (int)$ask_id . "'");

		foreach ($query->rows as $result) {
			$ask_store_data[] = $result['store_id'];
		}

		return $ask_store_data;
	}

 
	public function getTotalAsks($data) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ask i LEFT JOIN " . DB_PREFIX . "ask_description id ON (i.ask_id = id.ask_id)  WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ";
	
		    if (isset($data['ask_type_id']) && !is_null($data['ask_type_id'])) {
				$sql .= " AND i.ask_type_id = '" . (int)$data['ask_type_id'] . "'";
			}
	
			if (isset($data['filter_title']) && !is_null($data['filter_title'])) {
				$sql .= " AND id.title like '%" . $data['filter_title'] . "%'";
			}
			if (isset($data['filter_year']) && !is_null($data['filter_year'])) {
				$sql .= " AND i.year = '" . $data['filter_year'] . "'";
			}
			

		
	    $query = $this->db->query($sql);
	   
		return $query->row['total'];
	}	

	public function getTotalAsksByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ask_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
?>