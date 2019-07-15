<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#email_order').val('1');$('#form').submit();" class="button">發送報價單</a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
	      <div id="tabs" class="htabs"><a href="#tab-general">客戶資料</a><a href="#tab-attribute">自定義詢價</a><a href="#tab-data">客戶詢價訊息</a><a href="#tab-price">業務報價</a>  </div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
        <table class="form">
          <tr>
            <td>姓名</td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" />
			     <input id="email_order" type="hidden" name="email_order" value="0" />
            </td>
          </tr>
          <tr>
            <td>電話</td>
            <td><input type="text" name="phone" value="<?php echo $phone; ?>" />
            </td>
          </tr>
          <tr>
            <td>EMAIL</td>
            <td><input type="text" name="email" value="<?php echo $email; ?>" />
            </td>
          </tr>
          <tr>
            <td>傳真</td>
            <td><input type="text" name="fax" value="<?php echo $fax; ?>" />
            </td>
          </tr>
          <tr>
            <td>地址</td>
            <td><input type="text" name="address" value="<?php echo $address; ?>" />
            </td>
          </tr>
          <tr>
            <td>公司統編</td>
            <td><input type="text" name="union_no" value="<?php echo $union_no; ?>" />
            </td>
          </tr>
          <tr>
            <td>公司/單位/校系</td>
            <td><input type="text" name="company" value="<?php echo $company; ?>" />
            </td>
          </tr> 
		 <tr>
            <td>希望服務區域</td>
            <td><label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="台北店" <?php  if($shop_area=='台北店'){ echo 'checked="checked"';} ?> />台北店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="新竹店" <?php  if($shop_area=='新竹店'){ echo 'checked="checked"';} ?> >新竹店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="台中店" <?php  if($shop_area=='台中店'){ echo 'checked="checked"';} ?> >台中店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="高雄店" <?php  if($shop_area=='高雄店'){ echo 'checked="checked"';} ?> >高雄店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="電話網路服務" <?php  if($shop_area=='電話網路服務'   ){ echo 'checked="checked"';} ?> >電話網路服務  
</label>
            </td>
          </tr>
		 <tr>
            <td>希望服務方式</td>
            <td><label class="radio-inline">
<input type="radio" name="service_type" id="inlineRadio1" value="email" checked="checked" <?php  if($service_type=='email'  ){ echo 'checked="checked"';} ?> >電子郵件
</label>
<label class="radio-inline">
<input type="radio" name="service_type" id="inlineRadio1" value="telephone" <?php  if($service_type=='telephone'){ echo 'checked="checked"';} ?> >電話
</label>
<label class="radio-inline">
<input type="radio" name="service_type" id="inlineRadio1" value="english" <?php  if($service_type=='english'){ echo 'checked="checked"';} ?> >English service
</label>


            </td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_text; ?></td>
            <td><textarea name="enquiry" cols="60" rows="8"><?php echo $enquiry; ?></textarea>
          </td>
          </tr>
           <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="status">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
		</div>
		
        <div id="tab-attribute">
        <table class="form">
          <tr>
            <td>產品款式</td>
            <td><label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio1" value="T恤" <?php  if($product_type=='T恤'){ echo 'checked="checked"';} ?> /> T恤
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio2" value="Polo衫" <?php  if($product_type=='Polo衫'){ echo 'checked="checked"';} ?> /> Polo衫
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="帽子" <?php  if($product_type=='帽子'){ echo 'checked="checked"';} ?>/> 帽子
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="頭巾" <?php  if($product_type=='頭巾'){ echo 'checked="checked"';} ?> /> 頭巾
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="外套" <?php  if($product_type=='外套'){ echo 'checked="checked"';} ?> /> 外套
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="祭典服" <?php  if($product_type=='祭典服'){ echo 'checked="checked"';} ?> /> 祭典服
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="馬克杯" <?php  if($product_type=='馬克杯'){ echo 'checked="checked"';} ?> /> 馬克杯
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="運動服" <?php  if($product_type=='運動服'){ echo 'checked="checked"';} ?> /> 運動服
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="Babysuit" <?php  if($product_type=='Babysuit'){ echo 'checked="checked"';} ?> /> Babysuit
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="袋子" <?php  if($product_type=='袋子'){ echo 'checked="checked"';} ?> /> 袋子
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="抱枕" <?php  if($product_type=='抱枕'){ echo 'checked="checked"';} ?> /> 抱枕
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="旗幟" <?php  if($product_type=='旗幟'){ echo 'checked="checked"';} ?> /> 旗幟
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="背心" <?php  if($product_type=='背心'){ echo 'checked="checked"';} ?> /> 背心
</label>
 
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="其它產品" <?php  if($product_type=='其它產品'){ echo 'checked="checked"';} ?> /> 其它產品
</label>

            </td>
          </tr>
          <tr>
            <td>其他產品說明</td>
            <td><input type="text" name="other_type" value="<?php echo $other_type; ?>" />
            </td>
          </tr>
          <tr>
            <td>圖 檔 上 傳</td>
            <td>
			<?php  foreach($upload_files as $file){ ?>
			 <input type="hidden" name="upload_files[]" value="<?php echo $file; ?>" />
 			<a target="_blank" href="<?php echo HTTP_DOWNLOAD.'upload/'.$file ?>"><?php echo $file; ?></a>
			<?php } ?>
            </td>
          </tr>
          <tr>
            <td>預估數量</td>
            <td><input type="text" name="order_qty" value="<?php echo $order_qty; ?>" />
            </td>
          </tr>
          <tr>
            <td>預估時間</td>
            <td> <label class="radio-inline">
<input type="radio" name="order_time" id="inlineRadio1"  value="趕件"  <?php  if($order_time=='趕件'){ echo 'checked="checked"';} ?>  /> 趕件
</label>
<label class="radio-inline">
<input type="radio" name="order_time" id="inlineRadio1"  value="正常出貨即可"  <?php  if($order_time=='正常出貨即可'){ echo 'checked="checked"';} ?>  /> 正常出貨即可
</label>

            </td>
          </tr>
          <tr>
            <td>希望收到日期</td>
            <td><input name="shipping_month" type="text"   value="<?php echo $shipping_month; ?>" size="3">月<input name="shipping_day" type="text"   value="<?php echo $shipping_day; ?>" size="3">日
            </td>
          </tr>
 
 
         </table>
		</div>
		
		<div id="tab-data">
        <table class="form" style="border:thin">
          <tr>
            <td>產品款式</td>
            <td>供應材質與特色</td>
            <td>供應尺寸</td>
            <td>顏色</td>
            <td>數量</td>
            <td>設計圖檔</td>
             </td>
          </tr>
		  <?php foreach($inquiry_products as $key=>$product){ ?>
          <tr>
            <td><?php echo $product['name'] ?>
			<input type="hidden" name="inquiry_products[<?php  echo $key; ?>][name]" value="<?php echo $product['name'] ?>"  /></td>
            <td><?php echo $product['feature'] ?>
			<input type="hidden" name="inquiry_products[<?php  echo $key; ?>][feature]" value="<?php echo $product['feature'] ?>"  /></td>
            <td><?php echo $product['size'] ?>
			<input type="hidden" name="inquiry_products[<?php  echo $key; ?>][size]" value="<?php echo $product['size'] ?>"  />
			</td>
            <td><?php echo $product['color_name'] ?>
		       <input type="hidden" name="inquiry_products[<?php  echo $key; ?>][product_id]" value="<?php echo $product['product_id'] ?>"  />
		       <input type="hidden" name="inquiry_products[<?php  echo $key; ?>][color_name]" value="<?php echo $product['color_name'] ?>"  />
		       <input type="hidden" name="inquiry_products[<?php  echo $key; ?>][color_code]" value="<?php echo $product['color_code'] ?>"  />
		       <input type="hidden" name="inquiry_products[<?php  echo $key; ?>][color_id]" value="<?php echo $product['color_id'] ?>"  />

			</td>
            <td><?php echo $product['quantity'] ?>
			  <input type="hidden" name="inquery_products[<?php  echo $key; ?>][quantity]" value="<?php echo $product['quantity'] ?>"  />
 			</td>
            <td><a target="_blank" href="<?php echo $product['design_image'] ?>"><?php echo $product['design_image'] ?> </a>
			   <input type="hidden" name="inquiry_products[<?php  echo $key; ?>][design_image]" value="<?php echo $product['design_image'] ?>"  />
			   <input type="hidden" name="inquiry_products[<?php  echo $key; ?>][upload_file]" value="<?php echo $product['upload_file'] ?>"  />
			</td>
              
          </tr>
		  <?php } ?>
 		  </table>
		</div>
        <div id="tab-price">
 		<p style="color:#FF0000">虛擬賬號：<input name="vaccount" type="text"  readonly=""  value="<?php echo $vaccount; ?>"  > 保存后系統自動生成</p>
       <table class="form" style="border:thin" id="price">
          <tr>
            <td>產品款式</td>
            <td>供應材質與特色</td>
            <td>供應尺寸</td>
            <td>顏色</td>
             <td>數量</td>
             <td>單價</td>
             <td>金額</td>
             <td></td>
            </td>
          </tr>
		   <?php $price_row = 0; ?>
		  <?php foreach($inquiry_prices as $key=>$price){ ?>
		    <tbody id="price-row<?php echo $price_row; ?>">

          <tr>
            <td> 
			<input type="text" name="inquiry_prices[<?php  echo $price_row; ?>][name]" value="<?php echo $price['name'] ?>"  />
			<input type="hidden" name="inquiry_prices[<?php echo $price_row; ?>][sort_order]" value="<?php echo $price['sort_order']; ?>"  /></td>
            <td> 
			<input type="text" name="inquiry_prices[<?php  echo $price_row; ?>][feature]" value="<?php echo $price['feature'] ?>"  /></td>
            <td> 
			<input type="text" name="inquiry_prices[<?php  echo $price_row; ?>][size]" value="<?php echo $price['size'] ?>"  size="10" />
			</td>
            <td> 
		       <input type="text" name="inquiry_prices[<?php  echo $price_row; ?>][color_name]" value="<?php echo $price['color_name'] ?>" size="10"  />
		       <input type="hidden" name="inquiry_prices[<?php  echo $price_row; ?>][product_id]" value="<?php echo $price['product_id'] ?>"  />
		       <input type="hidden" name="inquiry_prices[<?php  echo $price_row; ?>][color_code]" value="<?php echo $price['color_code'] ?>"  />
		       <input type="hidden" name="inquiry_prices[<?php  echo $price_row; ?>][color_id]" value="<?php echo $price['color_id'] ?>"  />

			</td>
             <td> 
			  <input type="text" class="quantity" name="inquiry_prices[<?php  echo $price_row; ?>][quantity]" value="<?php echo $price['quantity'] ?>" size="10" onchange="change_price('<?php echo $price_row; ?>')"    />
 			</td>
            <td> 
			  <input type="text" class="price"  name="inquiry_prices[<?php  echo $price_row; ?>][price]" value="<?php echo $price['price'] ?>" size="10" onchange="change_price('<?php echo $price_row; ?>')"  />
 			</td>
            <td> 
			  <input   type="text" readonly=""  class="total" name="inquiry_prices[<?php  echo $price_row; ?>][total]" value="<?php echo $price['total'] ?>" size="10"  />
 			</td>
			 <td class="left"><a onclick="$('#price-row<?php echo $price_row; ?>').remove();change_price(<?php  echo $price_row; ?>)"" class="button">移除</a></td>

          </tr>
		  </tbody>
            <?php $price_row++; ?>
		  <?php } ?>
		  <tfoot>
              <tr>
                <td colspan="7"></td>
                <td class="left"><a onclick="addPrice();" class="button">新增品項</a></td>
              </tr>
              <tr>
                <td colspan="6"></td>
                <td class="left">合計金額： <input id="sub_total" type="text" name="sub_total" value="<?php echo $sub_total ?>" size="10"  /></td>
              </tr>
              <tr>
                <td colspan="6"></td>
                <td class="left">營業稅(+5%)<input id="tax" type="text" name="tax" value="<?php echo $tax ?>" size="10"  /></td>
              </tr>
              <tr>
                <td colspan="6"></td>
                <td class="left">總計金額： <input id="total" type="text" name="total" value="<?php echo $total ?>" size="10"  /></td>
              </tr>
			  
			  <tr>
                <td  align="right">報價單備註：</td>
                <td colspan="6"><textarea rows="5" cols="100" name="comment"><?php echo $comment ?></textarea></td>
              </tr>

        </tfoot>

 		  </table>
		</div>
 
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function change_price(price_row){
     total= $('#price-row'+price_row).find('.quantity').val()* $('#price-row'+price_row).find('.price').val();
     
	 var sub_total=0; 
	 $('#price-row'+price_row).find('.total').val(total);
	 
	 $('#price').find('.total').each(function(){
	 
 		
		sub_total+=$(this).val()*1;
	 });
	 
 	 $('#sub_total').val(sub_total);
	 $('#tax').val(Math.round(sub_total*0.05));
	 $('#total').val(Math.round(sub_total*1.05));

}



$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'product\']').val(ui.item.label);
		$('input[name=\'product_id\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

 var price_row = <?php echo $price_row; ?>;

function addPrice() {
	html  = '<tbody id="price-row' + price_row + '">';
    html += '  <tr>';
	html += '    <td class="left"><input type="text" name="inquiry_prices[' + price_row + '][name]" value=""   /> </td>';
	html += '    <td class="left"><input type="text" name="inquiry_prices[' + price_row + '][feature]" value=""  /> </td>';
	html += '    <td class="left"><input type="text" name="inquiry_prices[' + price_row + '][size]" value=""  size="10" /> </td>';
	html += '    <td class="left"><input type="text" name="inquiry_prices[' + price_row + '][color_name]" value="" size="10"  /> </td>';
	html += '    <td class="left"><input class="quantity"  type="text" name="inquiry_prices[' + price_row + '][quantity]" value="" size="10"   onchange="change_price(' + price_row + ')" /> </td>';
	html += '    <td class="left"><input class="price" type="text" name="inquiry_prices[' + price_row + '][price]" value="" size="10"  onchange="change_price(' + price_row + ')" /> </td>';
	html += '    <td class="left"><input class="total" type="text" name="inquiry_prices[' + price_row + '][total]" value="" size="10" /> </td>';
 	html += '    <td class="left"><a onclick="$(\'#price-row' + price_row + '\').remove(); change_price(' + price_row + ');" class="button">移除</a></td>';
    html += '  </tr>';	
    html += '</tbody>';
	
	$('#price tfoot').before(html);
	
	attributeautocomplete(attribute_row);
	
	attribute_row++;
}


//--></script> 

<script type="text/javascript"><!--
$('#tabs a').tabs(); 
 //--></script>
<?php echo $footer; ?>