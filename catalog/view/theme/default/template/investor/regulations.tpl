<?php echo $header; ?>
<div class="page-header" style="background-image: url(images/banner/info-investor.png)">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-6 col-sm-6 hidden-xs">
          			<ol class="breadcrumb">
            			<li><a href="index.php">首頁</a></li>
            			<li class="active">投資人專區</li>
          			</ol>
            	</div>
            	<div class="col-md-6 col-sm-6 col-xs-12">
    				<h2>公司概況與治理</h2>
                </div>
           	</div>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="double-border"></div>
    <!-- Secondary Header
    <div class="secondary-bar-new">
		<div class="container">
			<h3 class="title"> 董事會</h3>
        </div>
	</div>
	-->
    <!-- Start Body Content -->
  	<div class="main" role="main">
    	<div id="content" class="content full">
    		<div class="container">
            	<div class="row">
					<div class="col-md-3 sidebar left-sidebar">
						<?php echo $left ?>
					</div>
					<div class="col-md-9">
						<h3 class="title investor-title"><i class="fa fa-area-chart"></i> 公司概況與治理</h3>
						
						<h4 class="page-sub-title"><i class="fa fa-th-large"></i> 公司內部規章</h4>
						
						<div class="fck-editor">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th style="text-align:center;">標題</th>
											<th width="80" class="text-align-center">附檔</th>
										</tr>
									</thead>
									<tbody>
									<?php foreach($investor as $investor_s){ ?>
									<?php foreach($investor_s as $investor_v) {?>
									<tr>
										<td><?php echo $investor_v['name'] ?></td>
										<td align="center"><?php if($investor_v['url']){ ?><a href="index.php?route=investor/directors/download&download=<?php echo $investor_v['url']?>"><i class="fa fa-download"></i></a><?php } ?></td>
									</tr>
									<?php } ?>
									<?php } ?>
									</tbody>
								</table>
							</div>
						</div>
						
						
					</div>
				</div>
            </div>
       	</div>
   	</div>
<?php echo $footer; ?>