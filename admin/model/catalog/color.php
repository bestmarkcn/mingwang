<?php
class ModelCatalogColor extends Model {
	public function addColor($data) {
	     $data['date_added']=date('Y-m-d H:i:s');
         $this->db->insert('color',$data);
		 $color_id = $this->db->getLastId();

 	}

	public function editColor($color_id, $data) {
          $this->db->where('color_id',$color_id);
         $this->db->update('color',$data);
 	}

	public function deleteColor($color_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "color WHERE color_id = '" . (int)$color_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "color_description WHERE color_id = '" . (int)$color_id . "'");
	}	

	public function getColor($color_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "color d   WHERE d.color_id = '" . (int)$color_id . "'  ");

		return $query->row;
	}

	public function getColors($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "color d   WHERE 1=1";

		if (!empty($data['filter_name'])) {
			$sql .= " AND d.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'd.name',
			'd.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY d.name";	
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
	}

 
	public function getTotalColors() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "color");

		return $query->row['total'];
	}	
}
?>