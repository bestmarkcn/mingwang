<?php 
class ControllerInvestorFaq extends Controller {  
	private $error = array(); 
	public function index() { 
			$this->data['continue'] = $this->url->link('common/home');

			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

				
		       $this->load->model('catalog/information');
		       $contact_id = $this->model_catalog_information->addContact($this->request->post);

			    $template = new Template();
				$template->data=$this->request->post;
				$template->data['config_name']=$this->config->get('config_name');
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/contact.tpl')) {
					$html = $template->fetch($this->config->get('config_template') . '/template/mail/contact.tpl');
				} else {
					$html = $template->fetch('default/template/mail/voucher.tpl');
				}
		
			
  			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->config->get('config_email'.$this->config->get('config_language_id')));
			$mail->setFrom($this->request->post['email']);
			$mail->setSender("銘旺實業");
			$mail->setSubject("聯絡我們");
			//$mail->setText(strip_tags(html_entity_decode($this->request->post['enquiry'], ENT_QUOTES, 'UTF-8')));
			$mail->setHtml($html);				
			
		  	$mail->send();

		    if ($this->config->get('config_alert_emails')) {
 			    $emails = explode(',', $this->config->get('config_alert_emails'));
 				foreach ($emails as $email) {
					if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
						$mail->setTo($email);
						$mail->send();
					}
				}					
			}

				
	                echo "<script language=\"JavaScript\">\r\n";
	                echo " alert(\"您的表單已成功送出，我們會在收到您的資訊後，盡速與你聯繫！\");\r\n";
	                echo " location.href='index.php?route=investor/faq';\r\n";
	                echo "</script>";
	                exit;
	           
			}
			$this->document->setTitle("利害關係人連絡溝通");
			if (isset($this->error['captcha'])) {
				$this->data['error_captcha'] = $this->error['captcha'];
			} else {
				$this->data['error_captcha'] = '';
			}	

			if (isset($this->request->post['contactor'])) {
				$this->data['contactor'] = $this->request->post['contactor'];
			} else {
				$this->data['contactor'] ='';
			}
			if (isset($this->request->post['phone'])) {
				$this->data['phone'] = $this->request->post['phone'];
			} else {
				$this->data['phone'] = '';
			}
			if (isset($this->request->post['name'])) {
				$this->data['name'] = $this->request->post['name'];
			} else {
				$this->data['name'] = '';
			}
			if (isset($this->request->post['email'])) {
				$this->data['email'] = $this->request->post['email'];
			} else {
				$this->data['email'] = '';
			}
			if (isset($this->request->post['address'])) {
				$this->data['address'] = $this->request->post['address'];
			} else {
				$this->data['address'] = '';
			}
			if (isset($this->request->post['comments'])) {
				$this->data['comments'] = $this->request->post['comments'];
			} else {
				$this->data['comments'] = '';
			}
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/investor/faq.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/investor/faq.tpl';
			} else {
				$this->template = 'default/template/investor/faq.tpl';
			}
			$this->data['action'] = $this->url->link('investor/faq#ch');
			$this->children = array(
				'common/footer',
				'common/header',
				'investor/left'
			);

			$this->response->setOutput($this->render());										
 	}
 	protected function validate() {
		/*if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['enquiry']) < 1) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
			$this->error['enquiry'] = $this->language->get('error_enquiry');
		}
*/
		if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
			$this->error['captcha'] = "<font color='red'>驗證碼不正確</font>";
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}  	  
	}
}
?>