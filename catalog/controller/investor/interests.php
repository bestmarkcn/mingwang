<?php 
class ControllerInvestorInterests extends Controller {  
	public function index() { 
			$this->data['continue'] = $this->url->link('common/home');
			$this->document->setTitle("營業利益");
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/interests.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/interests.tpl';
			} else {
				$this->template = 'default/template/investor/interests.tpl';
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