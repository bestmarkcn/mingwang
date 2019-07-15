<?php
class ModelCatalogContact extends Model {
	public function addContact($data) {
 
 		$this->db->insert(DB_PREFIX . "contact",$data);

		$contact_id = $this->db->getLastId();

 	}

	public function editContact($contact_id, $data) {
  		$this->db->where('contact_id',$contact_id);
		$data['date_modified']=date('Y-m-d H:i:s');
		$data['user_id']=$this->user->getId();
 		$this->db->update(DB_PREFIX . "contact",$data);

	}

	public function deleteContact($contact_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "contact WHERE contact_id = '" . (int)$contact_id . "'");

 	}

	public function getContact($contact_id) {
		$query = $this->db->query("SELECT DISTINCT *  FROM " . DB_PREFIX . "contact r WHERE r.contact_id = '" . (int)$contact_id . "'");

		return $query->row;
	}

	public function getContacts($data = array()) {
		$sql = "SELECT * from contact r  WHERE  1=1";																																					  

		$sort_data = array(
 			'r.status',
			'r.date_added'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY r.date_added";	
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

	public function getTotalContacts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "contact");
 
		return $query->row['total'];
	}
 }
?>