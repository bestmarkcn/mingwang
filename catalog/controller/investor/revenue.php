<?php 
class ControllerInvestorRevenue extends Controller {  
	public function index() { 
			$this->document->setTitle("月營收報告");
			$this->load->model('investor/investor');
			$filter_ask_type_id=13;
			$this->data['year']=$this->model_investor_investor->getYear($filter_ask_type_id);
			if (isset($this->request->get['filter_year'])) {
				if($this->request->get['filter_year']=='no'){
					$filter_year=null;
				}else{
					$filter_year = $this->request->get['filter_year'];
				}
				
			} else {
				$filter_year = $this->data['year'][0]['year'];
			}


			$data = array(
			'ask_type_id'  => $filter_ask_type_id,
			'filter_year'  => $filter_year,
			);

			
			$investor= $this->model_investor_investor->getAsks($data);
			foreach ($investor as $investor_v) {
				$this->data['investor'][]=unserialize($investor_v['download']);
			}
			
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/revenue.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/revenue.tpl';
			} else {
				$this->template = 'default/template/investor/revenue.tpl';
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