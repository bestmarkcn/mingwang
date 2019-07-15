<?php
class ModelInvestorInvestor extends Model {
	public function getAsk($ask_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'ask_id=" . (int)$ask_id . "') AS keyword FROM " . DB_PREFIX . "ask WHERE ask_id = '" . (int)$ask_id . "'");

		return $query->row;
	}
	public function getYear($ask_type_id) {
		$query = $this->db->query("SELECT year from ". DB_PREFIX ." ask where ask_type_id=" . (int)$ask_type_id. " AND year !='' group by year order by year desc");
		
		return $query->rows;
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
				$sql .= " ORDER BY i.year";	
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
	    $sql ="SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ask i";
	
		    if (isset($data['ask_type_id']) && !is_null($data['ask_type_id'])) {
				$sql .= " AND i.ask_type_id = '" . (int)$data['ask_type_id'] . "'";
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