<?php 
class ControllerInvestorAudit extends Controller {  
	public function index() { 
			$this->data['continue'] = $this->url->link('common/home');
			$this->document->setTitle("內部稽核之組織及運作");
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/audit.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/audit.tpl';
			} else {
				$this->template = 'default/template/investor/audit.tpl';
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