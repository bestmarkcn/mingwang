<?php 
class ControllerNewsNewsDetail extends Controller {  
	public function index() { 
  		$this->data=array_merge($this->data,$this->language->load('news/news'));

		$this->load->model('news/news');

 
		$this->load->model('tool/image'); 

		if (isset($this->request->get['news_type_id'])) {
			$news_type_id = $this->request->get['news_type_id'];
		} else {
			$news_type_id = '1';
		}
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = '1';
		}
 
 		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

         if($this->request->get['news_type_id']==1){
         	$this->data['title'] = '最新消息';
         }else{
         	$this->data['title'] = '媒體報導';
         }
 
		 $this->data['back']=$this->url->link('news/news', 'page='.$page.'&news_type_id='.$news_type_id);
             $news_id=$this->request->get['news_id'];
			 $news_info= $this->model_news_news->getNews($news_id);
			 

 		      $this->data['news_type_info']= $this->model_news_news->getNewsType($news_info['news_type_id']);
		       $this->data['breadcrumbs'][] = array(
				'text'      => $this->data['news_type_info']['title'],
				'href'      => $this->url->link('news/news'),
                 'separator' => $this->language->get('text_separator')	
				);
			$news_info['description']=html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['news']=$news_info;

			 $this->data['breadcrumbs'][] = array(
				'text'      => $news_info['title'],
				'href'      => '#',
                 'separator' => $this->language->get('text_separator')	
			 );
			$results= $this->model_news_news->getNewsImages($news_id);

			foreach ($results as $result) {
				if ($result['image']) {
				   $image = $this->model_tool_image->resize($result['image'], 201, 268);
				} else {
					$image = false;
				}
    
            }
 
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/news_detail.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/news_detail.tpl';
			} else {
				$this->template = 'default/template/news/news_detail.tpl';
			}

			$this->children = array(
				'module/category',
 				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());										
 	}
}
?>