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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#restore').submit();" class="button"><?php echo $button_restore; ?></a><a onclick="$('#backup').submit();" class="button"><?php echo $button_backup; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $sitemap; ?>" method="post" enctype="multipart/form-data" id="restore">
        <table class="form">
          <tr>
            <td><a target="_blank" href="<?php echo $sitemap_url; ?>" >點擊查看目前網站地圖</a></td>
            <td><input   type="submit"  name="submit"  value="點擊重新生成"/></td>
          </tr>
          <tr>
            <td  colspan="2" style="color:#FF0000"> 本站SITEMAP地址：<?php echo $sitemap_url; ?></td>
           </tr>
          <tr>
            <td  colspan="2"> Google 提交地址：http://www.google.com/webmasters/sitemaps</td>
           </tr>
          <tr>
            <td colspan="2"> Yahoo 提交地址：http://sitemap.cn.yahoo.com/</td>
           </tr>
 

        </table>
      </form>
     </div>
  </div>
</div>
<?php echo $footer; ?>