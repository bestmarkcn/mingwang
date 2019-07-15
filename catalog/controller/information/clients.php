<?php 
class ControllerInformationClients extends Controller {  
	public function index() { 
			$this->data['continue'] = $this->url->link('common/home');
			$this->document->setTitle("客戶品牌");
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/clients.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/clients.tpl';
			} else {
				$this->template = 'default/template/information/clients.tpl';
			}

			$this->children = array(
				'common/footer',
				'common/header',
				'investor/left'
			);

			$this->response->setOutput($this->render());										
 	}
}
?>