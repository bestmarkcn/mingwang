<?php
class ControllerCatalogInquiry extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('catalog/inquiry');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/inquiry');

		$this->getList();
	} 

	public function insert() {
		$this->language->load('catalog/inquiry');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/inquiry');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_inquiry->addInquiry($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
 
		if (isset($this->request->get['filter_inquiry_no'])) {
			$url .= '&filter_inquiry_no=' . $this->request->get['filter_inquiry_no'];
		}
		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . $this->request->get['filter_phone'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('catalog/inquiry');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/inquiry');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			 $this->model_catalog_inquiry->editInquiry($this->request->get['inquiry_id'], $this->request->post);
			 $vaccount=$this->getvaccount($this->request->get['inquiry_id'],$this->request->post['total']);
             $this->model_catalog_inquiry->updateInquiry($this->request->get['inquiry_id'], array('vaccount'=>$vaccount));
		    if($this->request->post['email_order']=='1'){
               $this->mail_order($this->request->get['inquiry_id']);
            }
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
 
		if (isset($this->request->get['filter_inquiry_no'])) {
			$url .= '&filter_inquiry_no=' . $this->request->get['filter_inquiry_no'];
		}
		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . $this->request->get['filter_phone'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() { 
		$this->language->load('catalog/inquiry');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/inquiry');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $inquiry_id) {
				$this->model_catalog_inquiry->deleteInquiry($inquiry_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
 
		if (isset($this->request->get['filter_inquiry_no'])) {
			$url .= '&filter_inquiry_no=' . $this->request->get['filter_inquiry_no'];
		}
		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . $this->request->get['filter_phone'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {

		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
		if (isset($this->request->get['filter_phone'])) {
			$filter_phone = $this->request->get['filter_phone'];
		} else {
			$filter_phone = null;
		}
		if (isset($this->request->get['filter_inquiry_no'])) {
			$filter_inquiry_no = $this->request->get['filter_inquiry_no'];
		} else {
			$filter_inquiry_no = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

 
 		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}



		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'r.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
 
		if (isset($this->request->get['filter_inquiry_no'])) {
			$url .= '&filter_inquiry_no=' . $this->request->get['filter_inquiry_no'];
		}
		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . $this->request->get['filter_phone'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['insert'] = $this->url->link('catalog/inquiry/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/inquiry/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		$this->data['inquirys'] = array();

		$data = array(
			'filter_inquiry_no' => $filter_inquiry_no, 
			'filter_name'	  => $filter_name, 
			'filter_phone'	  => $filter_phone,
			'filter_email'	  => $filter_email,
 			'filter_status'   => $filter_status,
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$inquiry_total = $this->model_catalog_inquiry->getTotalInquirys();

		$results = $this->model_catalog_inquiry->getInquirys($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/inquiry/update', 'token=' . $this->session->data['token'] . '&inquiry_id=' . $result['inquiry_id'] . $url, 'SSL')
			);

			$this->data['inquirys'][] = array(
				'inquiry_id'  => $result['inquiry_id'],
				'inquiry_no'  => $result['inquiry_no'],
				'name'       => $result['name'],
				'phone'     => $result['phone'],
				'email'     => $result['email'],
				'enquiry'     => $result['enquiry'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'   => isset($this->request->post['selected']) && in_array($result['inquiry_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}	

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_product'] = $this->language->get('column_product');
		$this->data['column_author'] = $this->language->get('column_author');
		$this->data['column_rating'] = $this->language->get('column_rating');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_action'] = $this->language->get('column_action');		

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
 
		if (isset($this->request->get['filter_inquiry_no'])) {
			$url .= '&filter_inquiry_no=' . $this->request->get['filter_inquiry_no'];
		}
		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . $this->request->get['filter_phone'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_product'] = $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, 'SSL');
		$this->data['sort_author'] = $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . '&sort=r.author' . $url, 'SSL');
		$this->data['sort_rating'] = $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . '&sort=r.rating' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . '&sort=r.status' . $url, 'SSL');
		$this->data['sort_date_added'] = $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . '&sort=r.date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $inquiry_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();
		$this->data['filter_inquiry_no'] = $filter_inquiry_no;
		$this->data['filter_name'] = $filter_name;
 		$this->data['filter_phone'] = $filter_phone;
		$this->data['filter_email'] = $filter_email;
 		$this->data['filter_status'] = $filter_status;
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/inquiry_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_select'] = $this->language->get('text_select');

		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_rating'] = $this->language->get('entry_rating');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_text'] = $this->language->get('entry_text');
		$this->data['entry_good'] = $this->language->get('entry_good');
		$this->data['entry_bad'] = $this->language->get('entry_bad');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  
		if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}

 
		$url = '';
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
 
		if (isset($this->request->get['filter_inquiry_no'])) {
			$url .= '&filter_inquiry_no=' . $this->request->get['filter_inquiry_no'];
		}
		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . $this->request->get['filter_phone'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['inquiry_id'])) { 
			$this->data['action'] = $this->url->link('catalog/inquiry/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/inquiry/update', 'token=' . $this->session->data['token'] . '&inquiry_id=' . $this->request->get['inquiry_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/inquiry', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['inquiry_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$inquiry_info = $this->model_catalog_inquiry->getInquiry($this->request->get['inquiry_id']);
			$this->data['inquiry_products']  = $this->model_catalog_inquiry->getInquiryProducts($this->request->get['inquiry_id']);
			$this->data['inquiry_prices']  = $this->model_catalog_inquiry->getInquiryPrices($this->request->get['inquiry_id']);
			if(empty($this->data['inquiry_prices'])){
			  $this->data['inquiry_prices']=$this->data['inquiry_products'];
			}
  		}

		$this->data['token'] = $this->session->data['token'];

 		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($inquiry_info)) {
			$this->data['name'] = $inquiry_info['name'];
		} else {
			$this->data['name'] = '';
		}
 		if (isset($this->request->post['company'])) {
			$this->data['company'] = $this->request->post['company'];
		} elseif (!empty($inquiry_info)) {
			$this->data['company'] = $inquiry_info['company'];
		} else {
			$this->data['company'] = '';
		}

		if (isset($this->request->post['phone'])) {
			$this->data['phone'] = $this->request->post['phone'];
		} elseif (!empty($inquiry_info)) {
			$this->data['phone'] = $inquiry_info['phone'];
		} else {
			$this->data['phone'] = '';
		}

		if (isset($this->request->post['vaccount'])) {
			$this->data['vaccount'] = $this->request->post['vaccount'];
		} elseif (!empty($inquiry_info)) {
			$this->data['vaccount'] = $inquiry_info['vaccount'];
		} else {
			$this->data['vaccount'] = '';
		}
		if (isset($this->request->post['fax'])) {
			$this->data['fax'] = $this->request->post['fax'];
		} elseif (!empty($inquiry_info)) {
			$this->data['fax'] = $inquiry_info['fax'];
		} else {
			$this->data['fax'] = '';
		}
		if (isset($this->request->post['union_no'])) {
			$this->data['union_no'] = $this->request->post['union_no'];
		} elseif (!empty($inquiry_info)) {
			$this->data['union_no'] = $inquiry_info['union_no'];
		} else {
			$this->data['union_no'] = '';
		}

		if (isset($this->request->post['address'])) {
			$this->data['address'] = $this->request->post['address'];
		} elseif (!empty($inquiry_info)) {
			$this->data['address'] = $inquiry_info['address'];
		} else {
			$this->data['address'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} elseif (!empty($inquiry_info)) {
			$this->data['email'] = $inquiry_info['email'];
		} else {
			$this->data['email'] = '';
		}
		if (isset($this->request->post['shop_area'])) {
			$this->data['shop_area'] = $this->request->post['shop_area'];
		} elseif (!empty($inquiry_info)) {
			$this->data['shop_area'] = $inquiry_info['shop_area'];
		} else {
			$this->data['shop_area'] = '';
		}
		if (isset($this->request->post['service_type'])) {
			$this->data['service_type'] = $this->request->post['service_type'];
		} elseif (!empty($inquiry_info)) {
			$this->data['service_type'] = $inquiry_info['service_type'];
		} else {
			$this->data['service_type'] = '';
		}

		if (isset($this->request->post['enquiry'])) {
			$this->data['enquiry'] = $this->request->post['enquiry'];
		} elseif (!empty($inquiry_info)) {
			$this->data['enquiry'] = $inquiry_info['enquiry'];
		} else {
			$this->data['enquiry'] = '';
		}
 		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($inquiry_info)) {
			$this->data['status'] = $inquiry_info['status'];
		} else {
			$this->data['status'] = '';
		}
		if (isset($this->request->post['comment'])) {
			$this->data['comment'] = $this->request->post['comment'];
		} elseif (!empty($inquiry_info)) {
			$this->data['comment'] = $inquiry_info['comment'];
		} else {
			$this->data['comment'] = '';
		}

		if (isset($this->request->post['product_type'])) {
			$this->data['product_type'] = $this->request->post['product_type'];
		} elseif (!empty($inquiry_info)) {
			$this->data['product_type'] = $inquiry_info['product_type'];
		} else {
			$this->data['product_type'] = '';
		}
		if (isset($this->request->post['other_type'])) {
			$this->data['other_type'] = $this->request->post['other_type'];
		} elseif (!empty($inquiry_info)) {
			$this->data['other_type'] = $inquiry_info['other_type'];
		} else {
			$this->data['other_type'] = '';
		}
		if (isset($this->request->post['upload_files'])) {
			$this->data['upload_files'] = $this->request->post['upload_files'];
		} elseif (!empty($inquiry_info)) {
			$this->data['upload_files'] = unserialize($inquiry_info['upload_file']);
		} else {
			$this->data['upload_files'] = array();
		}
		if (isset($this->request->post['order_qty'])) {
			$this->data['order_qty'] = $this->request->post['order_qty'];
		} elseif (!empty($inquiry_info)) {
			$this->data['order_qty'] = $inquiry_info['order_qty'];
		} else {
			$this->data['order_qty'] = '';
		}
		if (isset($this->request->post['order_time'])) {
			$this->data['order_time'] = $this->request->post['order_time'];
		} elseif (!empty($inquiry_info)) {
			$this->data['order_time'] = $inquiry_info['order_time'];
		} else {
			$this->data['order_time'] = '';
		}
		if (isset($this->request->post['shipping_month'])) {
			$this->data['shipping_month'] = $this->request->post['shipping_month'];
		} elseif (!empty($inquiry_info)) {
			$this->data['shipping_month'] = $inquiry_info['shipping_month'];
		} else {
			$this->data['shipping_month'] = '';
		}
		if (isset($this->request->post['shipping_day'])) {
			$this->data['shipping_day'] = $this->request->post['shipping_day'];
		} elseif (!empty($inquiry_info)) {
			$this->data['shipping_day'] = $inquiry_info['shipping_day'];
		} else {
			$this->data['shipping_day'] = '';
		}
		if (isset($this->request->post['sub_total'])) {
			$this->data['sub_total'] = $this->request->post['sub_total'];
		} elseif (!empty($inquiry_info)) {
			$this->data['sub_total'] = $inquiry_info['sub_total'];
		} else {
			$this->data['sub_total'] = '0';
		}
		if (isset($this->request->post['tax'])) {
			$this->data['tax'] = $this->request->post['tax'];
		} elseif (!empty($inquiry_info)) {
			$this->data['tax'] = $inquiry_info['tax'];
		} else {
			$this->data['tax'] = '0';
		}
		if (isset($this->request->post['total'])) {
			$this->data['total'] = $this->request->post['total'];
		} elseif (!empty($inquiry_info)) {
			$this->data['total'] = $inquiry_info['total'];
		} else {
			$this->data['total'] = '0';
		}


		$this->template = 'catalog/inquiry_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/inquiry')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

 		if (utf8_strlen($this->request->post['enquiry']) < 1) {
			$this->error['enquiry'] = $this->language->get('error_text');
		}

 
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/inquiry')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	
	public function mail_order($inquiry_id) {
 		        $this->load->model('catalog/inquiry');
			    $template = new Template();
			    $subject = $this->config->get('config_name').'報價單';
 				
				$inquiry_info = $this->model_catalog_inquiry->getInquiry($inquiry_id);
              if($inquiry_info){
			    $template->data=$inquiry_info;
				$template->data['inquiry_no']=date('Ymd',strtotime($inquiry_info['date_added'])).$inquiry_info['inquiry_id'].'-'.$inquiry_info['num'];
 			    $template->data['inquiry_prices']  = $this->model_catalog_inquiry->getInquiryPrices($inquiry_id);
                $template->data['user_info']=$this->user->getUserInfo();
  				$html = $template->fetch('mail/order.tpl');
 		//	echo $html;
		//	exit;
			
			// Can not send confirmation emails for CBA orders as email is unknown
  				// Text Mail
 
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->hostname = $this->config->get('config_smtp_host');
				$mail->username = $this->config->get('config_smtp_username');
				$mail->password = $this->config->get('config_smtp_password');
				$mail->port = $this->config->get('config_smtp_port');
				$mail->timeout = $this->config->get('config_smtp_timeout');
				$mail->setTo( array($inquiry_info['email'],$template->data['user_info']['email'])  );
 				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($html);
			//	$mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
			 	$mail->send();
				
				$this->model_catalog_inquiry->updateInquiry($inquiry_id,array('num'=>$inquiry_info['num']+1,'inquiry_no'=> $template->data['inquiry_no'],'status'=>'1'));
			 }
	}
	
	public function getvaccount($inquiry_id,$total){ //根據銀行規則生成檢查碼
 		  
		  
			   $vaccount=$this->config->get('config_vaccount');
 			   $newaccount=$vaccount.date('ym',time()+3600*24*2).sprintf("%05d", $inquiry_id); // 
 			   $check_account=$this->config->get('config_vaccount_check');
			   $total=sprintf("%08d", $total);
			   $count=strlen($newaccount);
				$check_code=$check_total_code=0;
			   for($i=0;$i<$count;$i++){
				  $check_code+=fmod($newaccount[$i]*$check_account[$i],10);
				}
			   $check_code =fmod($check_code,10);
			   $check_code=(10-$check_code);
			
				$check_account=$this->config->get('config_total_check');
				$count=strlen($check_account);
			
				for($i=0;$i<$count;$i++){
				  $check_total_code+=fmod($check_account[$i]*$total[$i],10);
				}
			   $check_total_code= fmod($check_total_code,10);
			   $check_total_code=(10-$check_total_code);
			   $check_total_code= fmod($check_total_code,10);
			
			   $check_num= $check_total_code+$check_code;
			   return  $newaccount.fmod($check_num,10);
 	}
   public function output() {
   
   
		$this->load->model('catalog/inquiry');
 
   
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
		if (isset($this->request->get['filter_phone'])) {
			$filter_phone = $this->request->get['filter_phone'];
		} else {
			$filter_phone = null;
		}
		if (isset($this->request->get['filter_inquiry_no'])) {
			$filter_inquiry_no = $this->request->get['filter_inquiry_no'];
		} else {
			$filter_inquiry_no = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

 
 		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'r.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
     	
		$data='';
		$filename = time().'.csv';
 			$data.= $this->iconvstr('客戶名稱').",".$this->iconvstr('EMAIL').",".$this->iconvstr('公司').",".$this->iconvstr('統編').",".$this->iconvstr('電話').",".$this->iconvstr('傳真').",".$this->iconvstr('地址').",".$this->iconvstr('產品款式').",".$this->iconvstr('尺寸').",".$this->iconvstr('顏色').",".$this->iconvstr('數量').",".$this->iconvstr('單價').",".$this->iconvstr('金額')."\r\n";

		$this->data['customers'] = array();

		$filter_data = array(
			'filter_inquiry_no' => $filter_inquiry_no, 
			'filter_name'	  => $filter_name, 
			'filter_phone'	  => $filter_phone,
			'filter_email'	  => $filter_email,
 			'filter_status'   => $filter_status,
			'sort'  => $sort,
			'order' => $order
 		);

 
		$results = $this->model_catalog_inquiry->getInquirys($filter_data);

  		  		
		foreach($results as $customer){		
  					$data.= $this->iconvstr($customer['name']).",".$this->iconvstr($customer['email']).",".$this->iconvstr($customer['company']).",".$this->iconvstr($customer['union_no']).",".$this->iconvstr($customer['phone']).",".$this->iconvstr($customer['fax']).",".$this->iconvstr( $customer['address']) ;
 	 				 
 			     $inquiry_prices = $this->model_catalog_inquiry->getInquiryPrices( $customer['inquiry_id']);
				 $i=0;
				if($inquiry_prices){
				  foreach ($inquiry_prices as $product) {
  	                         if($i==0){
	   						    $data.=",".$this->iconvstr($product['name']).",".$this->iconvstr($product['size']).",".$this->iconvstr($product['color_name']).",".$this->iconvstr($product['quantity']).",".$this->iconvstr($product['price']).",".$this->iconvstr($product['total']);
 	                         }else{
	    						   $data.=",,,,,,,".$this->iconvstr($product['name']).",".$this->iconvstr($product['size']).",".$this->iconvstr($product['color_name']).",".$this->iconvstr($product['quantity']).",".$this->iconvstr($product['price']).",".$this->iconvstr($product['total']);
	                         }
	                         $i++;
                             $data.="\r\n";
				  }
                }else{
				 $data.="\r\n";
				}
  			}
// echo $data;
 //exit;
			
  		header("Content-type: text/csv;charset=UTF-8");

		header ("Content-Disposition: attachment; filename=" . $filename);
		
		header('Cache-Control:     must-revalidate,     post-check=0,     pre-check=0');
		
		header('Expires:     0');
		
		header('Pragma:     public');
		
		echo $data;
		exit;
	}
	function escapeCSV($str){
 		$str = str_replace(array(',','"',"\n","\r"),array('','""','',''),$str);
 		if($str == ""){
 			$str = '""';
 		}
	
		return $str;
	
	}
 	function iconvstr($str){
		//return $str;
	   return iconv('UTF-8','big5',$this->escapeCSV($str));
 	}
        
}
?>