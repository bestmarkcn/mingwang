<?php
class ModelCheckoutInquiry extends Model {
	public function addInquiry($data) {
         $data['date_modified']=date('Y-m-d H:i:s');
         $data['date_added']=date('Y-m-d H:i:s');
         $this->db->insert('inquiry',$data);


          $inquiry_id=  $this->db->getLastId();
		if (isset($data['products'])) {
			foreach ($data['products'] as $inquiry_product) {
 
                      $inquiry_product['inquiry_id']=$inquiry_id;
                     $this->db->insert('inquiry_product',$inquiry_product);
 			}
		}
 		return  $inquiry_id;
	}

 }
?>