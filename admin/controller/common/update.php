<?php
class ControllerCommonUpdate extends Controller {
	public function index() {


      $this->db->query('update '. $this->request->get['table'] .' set '.$this->request->get['field'].'='.$this->request->get['newval'] .' where '.$this->request->get['wherefield'].'='.$this->request->get['id'] );
   	  $this->response->setOutput('');
 	
	}

}
?>