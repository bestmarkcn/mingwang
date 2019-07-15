<?php  
class ControllerModuleNews extends Controller {
	protected function index($setting) {
		$this->load->model('news/news');
		
        $data=array('status'=>1,'news_type_id'=>1);
 		$this->data['newses']= $this->model_news_news->getNewses($data);
 		$results= $this->model_news_news->getNewses($data);


		foreach ($results as $result) {
 				$this->data['newses'][] = array(
					'news_id' => $result['news_id'],
					'title' => $result['title'],
					'date_added' => date('Y.m.d',strtotime($result['date_added'])),
 				     'href'      => $this->url->link('news/news_detail', 'news_id=' . $result['news_id'])
					//'image' => $this->model_tool_image->resize($result['image'], 250, 250)
				);
 		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news.tpl';
		} else {
			$this->template = 'default/template/module/news.tpl';
		}
		
		$this->render();
	}
}
?>