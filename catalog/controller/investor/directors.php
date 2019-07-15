<?php 
class ControllerInvestorDirectors extends Controller {  
	public function index() { 
			$this->document->setTitle("董事會");
			$this->load->model('investor/investor');
			$filter_ask_type_id=9;
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

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/directors.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/directors.tpl';
			} else {
				$this->template = 'default/template/investor/directors.tpl';
			}

			$this->children = array(
				'common/footer',
				'common/header',
				'investor/left'
			);

			$this->response->setOutput($this->render());										
 	}

 	public function download() {
		$download = $this->request->get['download'];
		
		if ($download) {
			$file = DIR_DOWNLOAD . $download;
			if (!headers_sent()) {
				if (file_exists($file)) {
					header('Content-Type: application/octet-stream');
					header('Content-Disposition: attachment; filename="' . $download . '"');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Length: ' . filesize($file));

					if (ob_get_level()) ob_end_clean();

					readfile($file, 'rb');

					exit;
				} else {
					exit('Error: Could not find file ' . $file . '!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} 
	}
}
?>