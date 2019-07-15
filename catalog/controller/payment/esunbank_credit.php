<?php
class ControllerPaymentEsunbankCredit extends Controller {
	protected function index() {


                if($this->config->get('esunbank_credit_test')=='1'){ 
				  $this->data['action'] = 'https://acqtest.esunbank.com.tw/acq_online/online/sale42.htm ';//測試網址
 			    }else{
			       $this->data['action'] = ' https://acq.esunbank.com.tw/acq_online/online/sale42.htm';//正式網址
                }  
				
 				$this->data['email'] = $this->customer->getEmail();
				$this->data['telephone'] = $this->customer->getTelephone();
                $this->data['payment'] = 'esunbank_credit';

 
 
                $this->load->model('checkout/order');
                $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

 				$this->data['order_id'] = $order_info['order_id'];
  
                $this->data['roturl'] =HTTP_SERVER.'esunbank_credit.php';
				//$this->url->link('payment/esunbank_credit/callback&order_id=' . $this->session->data['order_id']);
                $this->data['email'] = $order_info['email'];
 				$this->data['store_name'] = $this->config->get('config_name');                
				$this->data['MID'] = trim($this->config->get('esunbank_credit_merchant'));                
                $this->data['hashkey'] = trim($this->config->get('esunbank_credit_hashkey'));  
				$this->data['amount'] =(int)$order_info['total'];
                $this->data['CID'] ='';  
                $this->data['TID'] ='EC000001';  
             
			   
			    $check_url =  $this->data['MID'].'&'. $this->data['CID'].'&'. $this->data['TID'].'&'.$this->data['order_id'].'&'. $this->data['amount'].'&'. $this->data['roturl'] .'&'. $this->data['hashkey'] ;
                $this->data['M']=md5($check_url);
 
 
 
		$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/esunbank_credit.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/esunbank_credit.tpl';
		} else {
			$this->template = 'default/template/payment/esunbank_credit.tpl';
		}

		$this->render();
	}

	public function confirm() {
		$this->load->model('checkout/order');

	//	$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('esunbank_credit_order_status_id'));
	}
	
	 public function callback() {
             if (isset($_REQUEST['RC'])&&$_REQUEST['RC'] == '00') {
                $this->load->model('checkout/order');
				$order_id=$_REQUEST['ONO'];
				 //update by hong ���\��^�~�T�{�q��
                $this->model_checkout_order->confirm($order_id, $this->config->get('esunbank_credit_order_status_id'));

               // $this->model_checkout_order->update($order_id, $this->config->get('esunbank_credit_order_status_id'));
				$this->redirect($this->url->link('checkout/success'));
            }else{
 				$this->redirect($this->url->link('checkout/checkout&payerror='.$_REQUEST['RC'].'&msg='.urlencode('付款失敗')));

            }
            
      }

}
?>