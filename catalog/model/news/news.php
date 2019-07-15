<?php
class ModelNewsNews extends Model {
	public function getNews($news_id) {
		$query = $this->db->query("SELECT DISTINCT i.*,id.*,idt.title as name FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id)  LEFT JOIN " . DB_PREFIX . "news_type_description idt ON (i.news_type_id = idt.news_type_id)  LEFT JOIN " . DB_PREFIX . "news_to_store i2s ON (i.news_id = i2s.news_id) WHERE i.news_id = '" . (int)$news_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id')  . "' AND idt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  ");
	
		return $query->row;
	}
	public function getNewsType($news_type_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "news_type i LEFT JOIN " . DB_PREFIX . "news_type_description id ON (i.news_type_id = id.news_type_id)  WHERE i.news_type_id = '" . (int)$news_type_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id') . "'  ");
	
		return $query->row;
	}
	
	public function getNewses($data=array()) {
	
	   $sql="SELECT * FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store i2s ON (i.news_id = i2s.news_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ";

		if (isset($data['status'])) {
 		   $sql.=" AND i.status = '1'";
		}
		if (isset($data['news_type_id'])) {
 		   $sql.=" AND i.news_type_id = '".$data['news_type_id']."'";
		}



		$sql.="   ORDER BY i.sort_order DESC, LCASE(id.title) ASC";
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
	 public function getNewsImages($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_image WHERE news_id = '" . (int)$news_id . "' ORDER BY sort_order desc");

		return $query->rows;
	}


	public function getTotalNewses($data=array()) {
    
	   $sql="SELECT count(*) as total FROM " . DB_PREFIX . "news i LEFT JOIN " . DB_PREFIX . "news_description id ON (i.news_id = id.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store i2s ON (i.news_id = i2s.news_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  ";
	
		if (isset($data['status'])) {
 		   $sql.=" AND i.status = '1'";
		}
		if (isset($data['news_type_id'])) {
 		   $sql.=" AND i.news_type_id = '".$data['news_type_id']."'";
		}

	   
	   		$query = $this->db->query($sql);
	        return $query->row['total'];
	}

 	
 

 }
?>