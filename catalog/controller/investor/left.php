<?php 
class ControllerInvestorLeft extends Controller {  
	public function index() { 
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/left.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/left.tpl';
			} else {
				$this->template = 'default/template/investor/left.tpl';
			}

			$this->children = array(
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());										
 	}
}
?>