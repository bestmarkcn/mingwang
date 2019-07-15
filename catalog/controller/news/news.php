<?php 
class ControllerNewsNews extends Controller {  
	public function index() { 
  		$this->data=array_merge($this->data,$this->language->load('news/news'));

		$this->load->model('news/news');

 
		$this->load->model('tool/image'); 

 
		if (isset($this->request->get['news_type_id'])) {
			$news_type_id = $this->request->get['news_type_id'];
		} else {
			$news_type_id = '1';
		}
		if ($news_type_id==1) {
			$this->document->setTitle("最新消息");
		}else{
			$this->document->setTitle("媒體報導");
		}
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit =9;
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

 
			$this->data['newses'] = array();
 			
		    $this->data['news_type_info']= $this->model_news_news->getNewsType($news_type_id);
		
		   $this->data['breadcrumbs'][] = array(
				'text'      => $this->data['news_type_info']['title'],
				'href'      => $this->url->link('news/news'),
                 'separator' => $this->language->get('text_separator')	
				);

			 $this->data['heading_title']=$this->data['news_type_info']['title'];
 			$data = array(
 				'news_type_id'       => $news_type_id,
 				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
			$news_total = $this->model_news_news->getTotalNewses($data); 

			$results = $this->model_news_news->getNewses($data);

			foreach ($results as $result) {
				if ($result['image']) {
				   $image = $this->model_tool_image->resize($result['image'], 317, 214);
				} else {
					$image = $this->model_tool_image->resize('mark.png', 317, 214);
				}
                 $description=strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
 				$this->data['newses'][] = array(
					'news_id'  => $result['news_id'],
					'download'  => $result['download'],
					'thumb'       => $image,
					'day'			=>substr($result['date_added'],8,2),	
					'year'			=>substr($result['date_added'],0,7),
					'title'        => $result['title'],
					'description' => utf8_substr($description, 0,100) . '..',
  					'date_added'      =>  $result['date_added'] ,
 					'href'        => $this->url->link('news/news_detail', 'news_id=' . $result['news_id'].'&news_type_id='.$news_type_id.'&page='.$page )
				);
			}
  			
			$pagination = new Pagination();
			$pagination->total = $news_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('news/news', 'page={page}&news_type_id='.$news_type_id);

			$this->data['pagination'] = $pagination->render_index();

			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;

			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/news/news.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/news/news.tpl';
			} else {
				$this->template = 'default/template/news/news.tpl';
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