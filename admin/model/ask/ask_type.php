<?php
class ModelAskAskType extends Model {
	public function addAskType($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "ask_type SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$ask_type_id = $this->db->getLastId(); 

		foreach ($data['ask_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "ask_type_description SET ask_type_id = '" . (int)$ask_type_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['ask_type_store'])) {
			foreach ($data['ask_type_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "ask_type_to_store SET ask_type_id = '" . (int)$ask_type_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['ask_type_layout'])) {
			foreach ($data['ask_type_layout'] as $store_id => $layout) {
				if ($layout) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "ask_type_to_layout SET ask_type_id = '" . (int)$ask_type_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'ask_type_id=" . (int)$ask_type_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('ask_type');
	}

	public function editAskType($ask_type_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "ask_type SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE ask_type_id = '" . (int)$ask_type_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_type_description WHERE ask_type_id = '" . (int)$ask_type_id . "'");

		foreach ($data['ask_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "ask_type_description SET ask_type_id = '" . (int)$ask_type_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_type_to_store WHERE ask_type_id = '" . (int)$ask_type_id . "'");

		if (isset($data['ask_type_store'])) {
			foreach ($data['ask_type_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "ask_type_to_store SET ask_type_id = '" . (int)$ask_type_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_type_to_layout WHERE ask_type_id = '" . (int)$ask_type_id . "'");

		if (isset($data['ask_type_layout'])) {
			foreach ($data['ask_type_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "ask_type_to_layout SET ask_type_id = '" . (int)$ask_type_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'ask_type_id=" . (int)$ask_type_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'ask_type_id=" . (int)$ask_type_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('ask_type');
	}

	public function deleteAskType($ask_type_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_type WHERE ask_type_id = '" . (int)$ask_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_type_description WHERE ask_type_id = '" . (int)$ask_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_type_to_store WHERE ask_type_id = '" . (int)$ask_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ask_type_to_layout WHERE ask_type_id = '" . (int)$ask_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'ask_type_id=" . (int)$ask_type_id . "'");

		$this->cache->delete('ask_type');
	}	

	public function getAskType($ask_type_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'ask_type_id=" . (int)$ask_type_id . "') AS keyword FROM " . DB_PREFIX . "ask_type WHERE ask_type_id = '" . (int)$ask_type_id . "'");

		return $query->row;
	}

	public function getAskTypes($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "ask_type i LEFT JOIN " . DB_PREFIX . "ask_type_description id ON (i.ask_type_id = id.ask_type_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.title',
				'i.sort_order'
			);		

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY i.sort_order" ;	
			} else {
				$sql .= " ORDER BY i.sort_order";	
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
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
		} else {
			$ask_type_data = $this->cache->get('ask_type.' . (int)$this->config->get('config_language_id'));

			if (!$ask_type_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ask_type i LEFT JOIN " . DB_PREFIX . "ask_type_description id ON (i.ask_type_id = id.ask_type_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$ask_type_data = $query->rows;

				$this->cache->set('ask_type.' . (int)$this->config->get('config_language_id'), $ask_type_data);
			}	

			return $ask_type_data;			
		}
	}

	public function getAskTypeDescriptions($ask_type_id) {
		$ask_type_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ask_type_description WHERE ask_type_id = '" . (int)$ask_type_id . "'");

		foreach ($query->rows as $result) {
			$ask_type_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'description' => $result['description']
			);
		}

		return $ask_type_description_data;
	}

	public function getAskTypeStores($ask_type_id) {
		$ask_type_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ask_type_to_store WHERE ask_type_id = '" . (int)$ask_type_id . "'");

		foreach ($query->rows as $result) {
			$ask_type_store_data[] = $result['store_id'];
		}

		return $ask_type_store_data;
	}

 

	public function getTotalAskTypes() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ask_type");

		return $query->row['total'];
	}	

	public function getTotalAskTypesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ask_type_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
?>