<?php
class ControllerPaymentEsunbankAtm extends Controller {
	protected function index() {


                $this->data['action'] = 'https://netbank.esunbank.com.tw/webatm/payment/paymentUTF8.asp';
 				$this->data['email'] = $this->customer->getEmail();
				$this->data['telephone'] = $this->customer->getTelephone();
                $this->data['payment'] = 'esunbank_atm';

 
 
                $this->load->model('checkout/order');
                $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

 				$this->data['order_id'] = $order_info['order_id'];
				if(isset($order_info['order_no'])){
				  $this->data['order_no'] = $order_info['order_no'];
 				}else{
				  $this->data['order_no']='';
				}
				
				$this->data['roturl'] =$this->url->link('payment/esunbank_atm/callback');
				
				$this->data['amount'] =(int)$order_info['total'];

              //  $this->data['currency'] = $order_info['currency'];
              //  $this->data['amount'] = $this->currency->format($order_info['total'], $order_info['currency'], $order_info['value'], FALSE);
                $this->data['first_name'] = $order_info['payment_firstname'];
                $this->data['last_name'] = $order_info['payment_lastname'];
                $this->data['notify_url'] = $this->url->link('payment/esunbank_atm/callback&order_id=' . $this->session->data['order_id']);
                $this->data['email'] = $order_info['email'];
 				$this->data['store_name'] = $this->config->get('config_name');                
				$this->data['webatm_merchant'] = trim($this->config->get('esunbank_atm_merchant'));                
                 $this->data['webatm_hashkey'] = trim($this->config->get('esunbank_atm_hashkey'));  
				  $webatm_account=trim($this->config->get('webatm_account'));            
				  if(!empty($webatm_account)){
					$this->data['webatm_account'] = trim($this->config->get('webatm_account')).$order_info['order_id'];                
				  }else{
				   $this->data['webatm_account']='';
				  }
               
			   
			    $this->data['TransIdentifyNo']  = strtoupper(SHA1( $this->data['webatm_merchant'] . $this->data['webatm_account'] . $this->data['roturl'] . $this->data['order_id'] . $this->data['amount'] . $this->data['webatm_hashkey']));

 
 
 
 
		$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/esunbank_atm.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/esunbank_atm.tpl';
		} else {
			$this->template = 'default/template/payment/esunbank_atm.tpl';
		}

		$this->render();
	}

	public function confirm() {
		$this->load->model('checkout/order');

	//	$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('esunbank_atm_order_status_id'));
	}
	
	 public function callback() {
             if (isset($_REQUEST['atmTradeState'])&&$_REQUEST['atmTradeState'] == 'S') {
                $this->load->model('checkout/order');
				$order_id=$_REQUEST['TransNo'];
				 //update by hong ���\��^�~�T�{�q��
                $this->model_checkout_order->confirm($order_id, $this->config->get('esunbank_atm_order_status_id'));

               // $this->model_checkout_order->update($order_id, $this->config->get('esunbank_atm_order_status_id'));
				$this->redirect($this->url->link('checkout/success'));
            }else{
 				$this->redirect($this->url->link('checkout/checkout&payerror='.$_REQUEST['atmErrDesc'].'&msg='.urlencode('付款失敗')));

            }
            
      }

}
?>