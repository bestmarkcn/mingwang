<?php 
class ControllerToolSitemap extends Controller { 
	private $error = array();

	public function index() {		
		$this->language->load('tool/sitemap');

		$this->document->setTitle($this->language->get('heading_title'));

 
		$this->data['heading_title'] = $this->language->get('heading_title');

 
 
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),     		
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('tool/sitemap', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

 
		$this->data['sitemap'] = $this->url->link('tool/sitemap/update', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['sitemap_url']=HTTP_CATALOG.'sitemap.xml'; 
		$this->template = 'tool/sitemap.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	public function update() {
		$this->language->load('tool/sitemap');
		$content='<?xml version="1.0" encoding="UTF-8"?>
		<urlset
			xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
			   http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
		';
		$data_array=array(
			array(
				'loc'=>HTTP_CATALOG.'index.php',
				'priority'=>'1.0',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'always'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=information/information&amp;information_id=1',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=information/information/printinfo&amp;information_id=5',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=information/information/printinfo&amp;information_id=6',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=index.php?route=information/information/faq',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=information/information/shop',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=product/manufacturer',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=product/size',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=news/news&amp;news_type_id=1',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			),
			array(
				'loc'=>HTTP_CATALOG.'index.php?route=news/news&amp;news_type_id=2',
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
			)
			
			
			
		
 		);
		
		
		$this->load->model('catalog/product');
	    $results = $this->model_catalog_product->getProducts();
		foreach ($results as $result) {
		   $product_array[]= array(
				'loc'=>HTTP_CATALOG.'index.php?route=product/product&amp;product_id='.$result['product_id'],
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
		     	);
 		}
		$this->load->model('news/news');
		$results = $this->model_news_news->getNewss();
 		foreach ($results as $result) {
		   $product_array[]= array(
				'loc'=>HTTP_CATALOG.'index.php?route=news/news_detail&amp;news_id='.$result['news_id'],
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
		     	);
 		}
		$this->load->model('catalog/manufacturer');
		$results = $this->model_catalog_manufacturer->getManufacturers();
 		foreach ($results as $result) {
		   $product_array[]= array(
				'loc'=>HTTP_CATALOG.'index.php?route=product/manufacturer/info&amp;manufacturer_id='.$result['manufacturer_id'],
				'priority'=>'0.5',
				'lastmod'=>date('Y-m-d H:i:s'),
				'changefreq'=>'daily'
		     	);
 		}
        $data_array=array_merge( $data_array,$product_array);
		foreach($data_array as $data){
			$content.=$this->create_item($data);
		}
		$content.='</urlset>';
		$fp=fopen('../sitemap.xml','w+');
		fwrite($fp,$content);
		fclose($fp);
		$this->session->data['success'] = "網站地圖更新成功";

       $this->redirect($this->url->link('tool/sitemap', 'token=' . $this->session->data['token'], 'SSL'));

   }
   
	public function create_item($data){
			$item="<url>\n";
			$item.="<loc>".$data['loc']."</loc>\n";
			$item.="<priority>".$data['priority']."</priority>\n";
			$item.="<lastmod>".$data['lastmod']."</lastmod>\n";
			$item.="<changefreq>".$data['changefreq']."</changefreq>\n";
			$item.="</url>\n";
			return $item;
	}
}
?>