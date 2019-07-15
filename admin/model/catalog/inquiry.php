<?php
class ModelCatalogInquiry extends Model {
	public function addInquiry($data) {
 
 		$this->db->insert(DB_PREFIX . "inquiry",$data);

		$inquiry_id = $this->db->getLastId();

 	}

	public function editInquiry($inquiry_id, $data) {
  		$this->db->where('inquiry_id',$inquiry_id);
		$data['date_modified']=date('Y-m-d H:i:s');
		$data['user_id']=$this->user->getId();
 		$this->db->update(DB_PREFIX . "inquiry",$data);
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "inquiry_product WHERE inquiry_id = '" . (int)$inquiry_id . "'");
	    if (isset($data['inquiry_products'])) {
			foreach ($data['inquiry_products'] as $inquiry_product) {
                      $inquiry_product['inquiry_id']=$inquiry_id;
                     $this->db->insert('inquiry_product',$inquiry_product);
 			}
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "inquiry_price WHERE inquiry_id = '" . (int)$inquiry_id . "'");
	    if (isset($data['inquiry_prices'])) {
			foreach ($data['inquiry_prices'] as $inquiry_price) {
                      $inquiry_price['inquiry_id']=$inquiry_id;
                      $inquiry_price['date_added']=date('Y-m-d H:i:s');
                     $this->db->insert('inquiry_price',$inquiry_price);
 			}
		}
 	}
	public function updateInquiry($inquiry_id, $data) {
	
  		$this->db->where('inquiry_id',$inquiry_id);
		$data['date_modified']=date('Y-m-d H:i:s');
		$data['user_id']=$this->user->getId();
 		$this->db->update(DB_PREFIX . "inquiry",$data);
	}
	public function deleteInquiry($inquiry_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "inquiry WHERE inquiry_id = '" . (int)$inquiry_id . "'");

 	}

	public function getInquiry($inquiry_id) {
		$query = $this->db->query("SELECT DISTINCT *  FROM " . DB_PREFIX . "inquiry r WHERE r.inquiry_id = '" . (int)$inquiry_id . "'");

		return $query->row;
	}

	public function getInquirys($data = array()) {
		$sql = "SELECT * from inquiry r  WHERE  1=1";																																					  


		if (!empty($data['filter_name'])) {
			$sql .= " AND r.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_phone'])) {
			$sql .= " AND r.phone LIKE '" . $this->db->escape($data['filter_phone']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND r.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		if (!empty($data['filter_inquiry_no'])) {
			$sql .= " AND r.inquiry_no LIKE '" . $this->db->escape($data['filter_inquiry_no']) . "%'";
		}
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
		}


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

	public function getTotalInquirys() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "inquiry");
 
		return $query->row['total'];
	}
	
	public function getInquiryProducts($inquiry_id) {
		$query = $this->db->query("SELECT   *  FROM " . DB_PREFIX . "inquiry_product r WHERE r.inquiry_id = '" . (int)$inquiry_id . "'");

		return $query->rows;
	}
	public function getInquiryPrices($inquiry_id) {
		$query = $this->db->query("SELECT   *  FROM " . DB_PREFIX . "inquiry_price r WHERE r.inquiry_id = '" . (int)$inquiry_id . "'");

		return $query->rows;
	}
	
 }
?>