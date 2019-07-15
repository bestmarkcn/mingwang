<?php
class ControllerAskAsk extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('ask/ask');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('ask/ask');

		$this->getList();
	}

	public function insert() {
		$this->language->load('ask/ask');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('ask/ask');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_ask_ask->addAsk($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->post['ask_type_id'])) {
				$url .= '&filter_ask_type_id=' . $this->request->post['ask_type_id'];
			}

			$this->redirect($this->url->link('ask/ask', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('ask/ask');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('ask/ask');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_ask_ask->editAsk($this->request->get['ask_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->post['ask_type_id'])) {
				$url .= '&filter_ask_type_id=' . $this->request->post['ask_type_id'];
			}

			$this->redirect($this->url->link('ask/ask', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('ask/ask');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('ask/ask');


		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $ask_id) {
				$this->model_ask_ask->deleteAsk($ask_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['ask_type_id'])) {
				$url .= '&filter_ask_type_id=' . $this->request->get['ask_type_id'];
			}

			$this->redirect($this->url->link('ask/ask', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		$this->load->model('ask/ask_type');
		 $this->data['aks_types'] = $this->model_ask_ask_type->getAskTypes();
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'i.sort_order';
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

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		if (isset($this->request->get['filter_ask_type_id'])) {
			$url .= '&ask_type_id=' . $this->request->get['filter_ask_type_id'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => "返回資料分類",
			'href'      => $this->url->link('ask/ask_type', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['insert'] = $this->url->link('ask/ask/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('ask/ask/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	

		if (isset($this->request->get['filter_ask_type_id'])) {
			$filter_ask_type_id = $this->request->get['filter_ask_type_id'];
			$this->data['filter_ask_type_id'] = $this->request->get['filter_ask_type_id'];
		} else {
			$filter_ask_type_id = null;
			$this->data['filter_ask_type_id'] = null;
		}
		if (isset($this->request->get['filter_title'])) {
			$filter_title = $this->request->get['filter_title'];
			$this->data['filter_title'] = $this->request->get['filter_title'];
		} else {
			$filter_title = null;
			$this->data['filter_title']=null;
		}
		if (isset($this->request->get['filter_year'])) {
			$filter_year = $this->request->get['filter_year'];
			$this->data['filter_year'] = $this->request->get['filter_year'];
		} else {
			$filter_year = null;
			$this->data['filter_year']=null;
		}
		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
			$this->data['filter_status'] = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
			$this->data['filter_status']=null;
		}

		$this->data['asks'] = array();

		$data = array(
			'ask_type_id'  => $filter_ask_type_id,
			'filter_title'  => $filter_title,
			'filter_year'  => $filter_year,
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$ask_total = $this->model_ask_ask->getTotalAsks($data);
		
		$results = $this->model_ask_ask->getAsks($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('ask/ask/update', 'token=' . $this->session->data['token'] . '&ask_id=' . $result['ask_id'] . $url, 'SSL')
			);

			$this->data['asks'][] = array(
				'ask_id' => $result['ask_id'],
				'ask_type'          => $result['ask_type'],
				'title'          => $result['title'],
				'sort_order'     => $result['sort_order'],
				'selected'       => isset($this->request->post['selected']) && in_array($result['ask_id'], $this->request->post['selected']),
				'action'         => $action
			);
		}	

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
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

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_title'] = $this->url->link('ask/ask', 'token=' . $this->session->data['token'] . '&sort=id.title' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('ask/ask', 'token=' . $this->session->data['token'] . '&sort=i.sort_order' . $url, 'SSL');

		$url = '';
		if (isset($this->request->get['filter_ask_type_id'])) {
			$url .= '&filter_ask_type_id='.$this->request->get['filter_ask_type_id'];
		} 
		
		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title='.$this->request->get['filter_title'];
		} 
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status='.$this->request->get['filter_status'];
			
		}
		if (isset($this->request->get['filter_year'])) {
			$url .= '&filter_year='.$this->request->get['filter_year'];
			
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $ask_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('ask/ask', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'ask/ask_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_bottom'] = $this->language->get('entry_bottom');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_layout'] = $this->language->get('entry_layout');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_design'] = $this->language->get('tab_design');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		if (isset($this->request->get['ask_type_id'])) {
			$url .= '&filter_ask_type_id=' . $this->request->get['ask_type_id'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),     		
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('ask/ask', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);
		 $this->load->model('ask/ask_type');

        $this->data['ask_types'] = $this->model_ask_ask_type->getAskTypes();

		if (!isset($this->request->get['ask_id'])) {
			$this->data['action'] = $this->url->link('ask/ask/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('ask/ask/update', 'token=' . $this->session->data['token'] . '&ask_id=' . $this->request->get['ask_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('ask/ask', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['ask_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$ask_info = $this->model_ask_ask->getAsk($this->request->get['ask_id']);
		}

		$this->data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['ask_description'])) {
			$this->data['ask_description'] = $this->request->post['ask_description'];
		} elseif (isset($this->request->get['ask_id'])) {
			$this->data['ask_description'] = $this->model_ask_ask->getAskDescriptions($this->request->get['ask_id']);
		} else {
			$this->data['ask_description'] = array();
		}

		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['ask_store'])) {
			$this->data['ask_store'] = $this->request->post['ask_store'];
		} elseif (isset($this->request->get['ask_id'])) {
			$this->data['ask_store'] = $this->model_ask_ask->getAskStores($this->request->get['ask_id']);
		} else {
			$this->data['ask_store'] = array(0);
		}		

		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($ask_info)) {
			$this->data['keyword'] = $ask_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['ask_type_id'])) {
			$this->data['ask_type_id'] = $this->request->post['ask_type_id'];
		} elseif (!empty($ask_info)) {
			$this->data['ask_type_id'] = $ask_info['ask_type_id'];
		} else {
			$this->data['ask_type_id'] = $this->request->get['ask_type_id'];
		}
		if (isset($this->request->post['bottom'])) {
			$this->data['bottom'] = $this->request->post['bottom'];
		} elseif (!empty($ask_info)) {
			$this->data['bottom'] = $ask_info['bottom'];
		} else {
			$this->data['bottom'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($ask_info)) {
			$this->data['status'] = $ask_info['status'];
		} else {
			$this->data['status'] = 1;
		}
		if (isset($this->request->post['year'])) {
			$this->data['year'] = $this->request->post['year'];
		} elseif (!empty($ask_info)) {
			$this->data['year'] = $ask_info['year'];
		} else {
			$this->data['year'] = '';
		}
		if (isset($this->request->post['download'])) {
			$this->data['download'] = $this->request->post['download'];
		} elseif (!empty($ask_info)) {
			$this->data['download'] = unserialize($ask_info['download']);
		} else {
			$this->data['download'] = array();
		}
		/*if (!empty($download)) {
			foreach ($download as $key => $value) {
				$sort[$key] = $value['order'];
			}
			
			array_multisort($sort,SORT_DESC,$download);
		}
		*/


		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($ask_info)) {
			$this->data['sort_order'] = $ask_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}
 
 
		$this->template = 'ask/ask_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'ask/ask')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['ask_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			/*if (utf8_strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}*/
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'ask/ask')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('setting/store');

		foreach ($this->request->post['selected'] as $ask_id) {
			if ($this->config->get('config_account_id') == $ask_id) {
				$this->error['warning'] = $this->language->get('error_account');
			}

			if ($this->config->get('config_checkout_id') == $ask_id) {
				$this->error['warning'] = $this->language->get('error_checkout');
			}

			if ($this->config->get('config_affiliate_id') == $ask_id) {
				$this->error['warning'] = $this->language->get('error_affiliate');
			}

			/*$store_total = $this->model_setting_store->getTotalStoresByAskId($ask_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}*/
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>