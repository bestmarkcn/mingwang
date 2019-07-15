<?php 
class ControllerProductDesign extends Controller {  
	public function index() { 
 
		$this->load->model('catalog/category');	
		$this->load->model('catalog/product');

		$this->load->model('tool/image');		

		$this->document->setTitle('線上合成圖');

		$this->data['heading_title'] = '線上合成圖';

		$this->data['text_index'] = $this->language->get('text_index');
		$this->data['text_empty'] = $this->language->get('text_empty');

		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text'      => '線上合成圖',
			'href'      => $this->url->link('product/design'),
		     'separator' => $this->language->get('text_separator')
		);

 	    $this->data['categories'] = $this->model_catalog_category->getCategories();

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
		
		    $products = $this->model_catalog_product->getProducts();
 			$product_info=array_shift($products);
			$product_id = $product_info['product_id'];
		}
		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
 
			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name_en'].$product_info['name'],
				'href'      => $this->url->link('product/product&product_id='.$product_id),
				 'separator' => $this->language->get('text_separator')
			);

 
 				$this->data['category_info'] = $this->model_catalog_product->getCategoryByProductId($product_id);
				$path = $this->model_catalog_category->getParentCategoriesByCategoryId($this->data['category_info']['category_id']);
                 $this->data['category_id'] = $path[1];
                 $this->data['sub_category_id']=$path[0];
                 $this->data['product_id']=$product_id;
                 $this->data['design']=HTTP_IMAGE.$product_info['design'];
 				 
			$this->data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($product_id);

			foreach ($results as $result) {
				$this->data['images'][] = array(
				    'product_image_id'=>$result['product_image_id'],
				    'color_name'=>$result['color_name'],
				    'color_code'=>trim($result['color_code']),
					'image' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'color_image' => $this->model_tool_image->resize($result['color_image'], 30,30)
				);
			}	
				 

       }

		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/design.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/design.tpl';
		} else {
			$this->template = 'default/template/product/design.tpl';
		}			

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);

		$this->response->setOutput($this->render());										
	}
	
	
	
	public function category() {
		$json = array();

		$this->load->model('catalog/category');	
		$this->load->model('catalog/product');

		$category_info = $this->model_catalog_category->getCategory($this->request->get['category_id']);
 
		if ($category_info) {
 
			$json = array(
				'category_id'        => $category_info['category_id'],
				'name'              => $category_info['name'],
  				'sub_categories'              =>  $this->model_catalog_category->getCategories($this->request->get['category_id'])
 			);
		}

		$this->response->setOutput(json_encode($json));
	}
	public function product() {
		$json = array();

		$this->load->model('catalog/category');	
		$this->load->model('catalog/product');

		$category_info = $this->model_catalog_category->getCategory($this->request->get['category_id']);
        $products=array();
		if ($category_info) {
 
 				$data = array(
					'filter_category_id'  => $this->request->get['category_id'],
					'filter_sub_category' => true
				);

 			    $product_results = $this->model_catalog_product->getProducts($data);

              foreach($product_results as $product){
			  
			      $products[]=array('product_id'=>$product['product_id'],
				                    'name'=>$product['name'],
									'name_en'=>$product['name_en']
									);
			  }
 
			$json = array(
				'category_id'       => $category_info['category_id'],
				'name'              => $category_info['name'],
  				'products'    =>  $products
 			);
		}

		$this->response->setOutput(json_encode($json));
	}

	public function upload() {
 
		$json = array();

 		if (!isset($json['error'])) {	
			if (!empty($this->request->files['file']['name'])) {
				$filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));

				if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
					$json['error'] = $this->language->get('error_filename');
				}	  	
 				// Allowed file extension types
				$allowed = array();
 				$filetypes = explode("\n", $this->config->get('config_file_extension_allowed'));
 				$filetypes=array('jpeg','jpg','png','icon','gif');
				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}
				if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
					$json['error'] = '文件類型不符合，請上傳圖片格式';
				}	

				// Allowed file mime types		
				$allowed = array();

				$filetypes = explode("\n", $this->config->get('config_file_mime_allowed'));

				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}

				if (!in_array($this->request->files['file']['type'], $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}

				if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
					$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
				}

				if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
					$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
				}
			} else {
				$json['error'] = $this->language->get('error_upload');
			}
		}

		if (!isset($json['error'])) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$ext = md5(mt_rand());
 				$pathinfo=pathinfo($filename);
				$token=time();
				$new_filename=$token.'.'.$pathinfo['extension'];
				$json['filename'] = $new_filename;
 				$json['token'] = $token;
 				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD.'temp/' . $new_filename );
			}

			$json['success'] = $this->language->get('text_upload');
		}	

		$this->response->setOutput(json_encode($json));
	}
	
	
	public function finish(){
		if(isset($this->request->post['imageData'])){
			$imageData = isset($this->session->data['imageData']) ? $this->session->data['imageData'] : '';
			$imageData .= $this->request->post['imageData'];

			$imageIndex = $this->request->post['imageIndex'];
			$imageCount = $this->request->post['imageCount'];
			if($imageIndex < $imageCount){
				$this->session->data['imageData'] = $imageData;
				$res = array(
					'errorCode' => 0
				);
				echo (json_encode($res));
				exit();
			}

			unset($this->session->data['imageData']);

			//$imageData = $this->request->post['imageData'];
			$filteredData=substr($imageData, strpos($imageData, ",")+1);
			$unencodedData=base64_decode($filteredData);
			$token = time();
			$fileName = $token . '.png';
			
			$mainDir = $this->config->get('pcpb_path_folder_save_temprarily');
			if(!$mainDir || $mainDir == '' || !is_writable(DIR_IMAGE . $mainDir))
				$mainDir = 'user/';
			
			$imagePath = DIR_DOWNLOAD . $mainDir . $fileName;
			$fp = fopen($imagePath , 'wb');
			fwrite($fp, $unencodedData);
			fclose($fp);
			
			$content = $this->config->get('config_url') . 'download/' . $mainDir . $fileName;
			//$this->load->model('pcpb/pcpb');
			//$id = $this->model_pcpb_pcpb->insertImage($token, $content);
			
 				$res = array(
					'errorCode' => 0,
					'content' => $content,
					'token' => $token);
 				echo (json_encode($res));
				exit();
		//	}
		}
		$res = array(
			'errorCode' => 1,
			'errorMessage' => 'save fail'
		);
		echo (json_encode($res));
		exit();
		
	}
	
	
	
 }
?>