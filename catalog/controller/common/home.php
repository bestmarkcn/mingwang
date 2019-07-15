<?php  
class ControllerCommonHome extends Controller {
	public function index() {
 		$this->document->setTitle($this->config->get('config_name'.$this->config->get('config_language_id')));
		$this->document->setDescription($this->config->get('config_meta_description'.$this->config->get('config_language_id')));
		$this->document->setKeywords($this->config->get('config_title'.$this->config->get('config_language_id')));
		//$this->data['heading_title'] = $this->config->get('config_title'.$this->config->get('config_language_id'));

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		$this->load->model('news/news');
		$this->load->model('catalog/product');
		
 				
		$this->data['banners1'] = array();
		
		$results = $this->model_design_banner->getBanner(1);

		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['banners1'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], 120, 70)
				);
			}
		}



   
		$this->data['banners3'] = array();
        $data=array('status'=>1,'news_type_id'=>1,'limit'=>4);
 		$results= $this->model_news_news->getNewses($data);


		foreach ($results as $result) {
				if ($result['image']) {
				   $image = $this->model_tool_image->resize($result['image'], 235, 178);
				} else {
					$image = $this->model_tool_image->resize('mark.png', 235, 178);
				}
 				$this->data['news1'][] = array(
					'news_id' => $result['news_id'],
					'title' => $result['title'],
					'date_added' => date('Y-m-d',strtotime($result['date_added'])),
 					'description'  => mb_substr(strip_tags(html_entity_decode($result['description'])),0,80,'utf-8'),
					'image' => $image,
					'href'  => $this->url->link('news/news_detail', 'news_id=' . $result['news_id'].'&news_type_id=1' )
					);
 		}

 		$data=array('status'=>1,'news_type_id'=>11,'limit'=>4);
 		$results= $this->model_news_news->getNewses($data);


		foreach ($results as $result) {
				if ($result['image']) {
				   $image = $this->model_tool_image->resize($result['image'], 235, 178);
				} else {
					$image = $this->model_tool_image->resize('mark.png', 235, 178);
				}
 				$this->data['news11'][] = array(
					'news_id' => $result['news_id'],
					'title' => $result['title'],
					'date_added' => date('Y-m-d',strtotime($result['date_added'])),
 					'description'  => mb_substr(strip_tags(html_entity_decode($result['description'])),0,80,'utf-8'),
					'image' => $image,
					'href'  => $this->url->link('news/news_detail', 'news_id=' . $result['news_id'] .'&news_type_id=11')
					);
 		}
 		

 

        $data=array('filter_ishome'=>1);
 		$results  = $this->model_catalog_product->getProducts($data);
 		foreach ($results as $result) {
 				$this->data['products'][] = array(
					'manufacturer_id' => $result['product_id'],
					'name' => $result['name'],
  					'description'  => mb_substr(strip_tags(html_entity_decode($result['description'])),0,80,'utf-8'),
					'image' => $this->model_tool_image->resize($result['image'], 420, 420),
					 'href'  => $this->url->link('product/product', 'product_id=' . $result['product_id']  )
				);
         }
		 
 		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
 			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>