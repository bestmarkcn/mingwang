<?php 
class ControllerInvestorDividend extends Controller {  
	public function index() { 
			$this->data['continue'] = $this->url->link('common/home');
			$this->document->setTitle("股利資訊");
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/dividend.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/dividend.tpl';
			} else {
				$this->template = 'default/template/investor/dividend.tpl';
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