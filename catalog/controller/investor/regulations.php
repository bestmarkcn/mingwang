<?php 
class ControllerInvestorRegulations extends Controller {  
	public function index() { 
			$this->document->setTitle("公司內部規章");
			$this->load->model('investor/investor');
			$filter_ask_type_id=7;
			if (isset($this->request->get['filter_year'])) {
				$filter_year = $this->request->get['filter_year'];
			} else {
				$filter_year = null;
			}

			$data = array(
			'ask_type_id'  => $filter_ask_type_id,
			'filter_year'  => $filter_year,
			);

			$this->data['year']=$this->model_investor_investor->getYear($filter_ask_type_id);
			$investor= $this->model_investor_investor->getAsks($data);
			foreach ($investor as $investor_v) {
				$this->data['investor'][]=unserialize($investor_v['download']);
			}
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/regulations.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/regulations.tpl';
			} else {
				$this->template = 'default/template/investor/regulations.tpl';
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