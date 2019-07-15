<?php echo $header; ?>
 

<div class="page-header" style="background-image:url(images/banner/info-news.png)">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-6 col-sm-6 hidden-xs">
          			<ol class="breadcrumb">
            			<li><a href="index.php">首頁</a></li>
            			<li class="active">新聞專區</li>
          			</ol>
            	</div>
            	<div class="col-md-6 col-sm-6 col-xs-12">
    				<h2><?php echo $news_type_info['title'] ?></h2>
                </div>
           	</div>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="double-border"></div>
    <!-- Secondary Header -->
    <div class="secondary-bar-new">
		<div class="container">
			<ul class="nav nav-pills pull-right">
				<li><a href="index.php?route=news/news&amp;news_type_id=1">最新消息</a></li>
				<li><a href="index.php?route=news/news&amp;news_type_id=11">媒體報導</a></li>
			</ul>
			<h3 class="title"><i class="fa fa-calendar"></i> <?php echo $news_type_info['title'] ?></h3>
        </div>
	</div>
    <!-- Start Body Content -->
    <?php if($news_type_info['news_type_id'] == 1) {?>
  	<div class="main" role="main">
    	<div id="content" class="content full">
    		<div class="container">
        		<div class="row">
            		<div class="col-md-12">
                    	<div class="events-listing">
                            <ul class="upcoming-events listing-content">
                            <?php foreach($newses as $newses_v) { ?>
                            	<li>
                                	<img src="http://placehold.it/80x80&amp;text=IMAGE+PLACEHOLDER" alt="" class="img-thumbnail event-thumb">
                                    <span class="event-date">
                                    	<span class="day"><?php echo $newses_v['day'] ?></span>
                                        <span class="monthyear"><?php echo $newses_v['year'] ?></span>
                                   	</span>
                                    <div class="event-excerpt">
                                    	<h3 class="event-title"><a href="<?php echo $newses_v['href'] ?>"><?php echo $newses_v['title'] ?></a></h3>
                                    	<p class="event-intro"><?php echo $newses_v['description'] ?></p>
                                    </div>
                               	</li>
                              	<?php } ?>
                            </ul>
                        </div>
                   	</div>
              	</div>
				<div class="spacer-20"></div>
				<div class="page-sort text-align-center">
					<ul class="pagination">
					 <?php echo $pagination ?>
					</ul>
				</div>
            </div>
       	</div>
   	</div>
   	<?php }else { ?>
   	<div class="main" role="main">
    	<div id="content" class="content full">
    		<div class="container">
        		<div class="row">
        		<?php foreach($newses as $newses_v) {?>
            		<div class="col-md-4">
                    	<div data-appear-animation="fadeInRight" data-appear-animation-delay="1" class="appear-animation fadeInRight appear-animation-visible media-listing">
                            <div class="media-box">
								<img src="<?php echo $newses_v['thumb'] ?>" class="img-thumbnail post-thumb" alt="">
								<div class="media-mask">
									<div class="btn-group-justified">
									<a href="<?php echo $newses_v['href'] ?>" class="btn btn-default">查看詳情</a>
									<a href="index.php?route=investor/directors/download&download=<?php echo $newses_v['download'] ?>" class="btn btn-default">檔案下載</a>
									</div>
								</div>
							</div>
							<h3 class="post-title"><a href="<?php echo $newses_v['href'] ?>"><?php echo $newses_v['title'] ?></a></h3>
							<span class="post-time meta-data"><?php echo substr($newses_v['date_added'],0,10) ?></span>
                        </div>
                   	</div>
                   <?php } ?>
              	</div>
				<div class="spaced"></div>
				<div class="page-sort text-align-center">
					<ul class="pagination">
						<?php echo $pagination ?>
					</ul>
				</div>
            </div>
       	</div>
   	</div>
   	<?php } ?>





 </div><?php echo $footer; ?>