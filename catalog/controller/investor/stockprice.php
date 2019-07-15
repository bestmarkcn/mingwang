<?php 
class ControllerInvestorStockprice extends Controller {  
	public function index() { 
			$this->data['continue'] = $this->url->link('common/home');
			$this->document->setTitle("股價資訊");
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/stockprice.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/stockprice.tpl';
			} else {
				$this->template = 'default/template/investor/stockprice.tpl';
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