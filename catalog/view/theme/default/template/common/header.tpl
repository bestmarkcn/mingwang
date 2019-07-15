<!DOCTYPE HTML>

<html class="no-js">
<head>
<!-- Basic Page Needs
  ================================================== -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title ?></title>
<meta name="description" content="<?php echo $description ?>">
<meta name="keywords" content="<?php echo $keywords ?>">
<meta name="author" content="">
<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="format-detection" content="telephone=no">
<!-- CSS
  ================================================== -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="vendor/prettyphoto/css/prettyPhoto.css" rel="stylesheet" type="text/css">
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css"><!-- MAGINIFIC LIGHTBOX -->
<link href="vendor/rs-plugin/css/settings.css" media="screen" rel="stylesheet" type="text/css"><!-- REVOLUTION SLIDER -->
<link href="vendor/rs-plugin/css/navstylechange.css" media="screen" rel="stylesheet" type="text/css"><!-- REVOLUTION SLIDER -->
<!--[if lte IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
<link href="css/custom.css" rel="stylesheet" type="text/css"><!-- CUSTOM STYLESHEET FOR STYLING -->
<!-- Color Style -->
<link href="colors/color1.css" rel="stylesheet" type="text/css">
<!-- SCRIPTS
  ================================================== -->
<script src="js/modernizr.js"></script><!-- Modernizr -->
</head>
<?php if($this->request->get['route']=='common/home' || $this->request->get['route']==''){ ?>
<body class="home">
<?php }else{ ?>
<body>
<?php } ?>
<!--[if lt IE 7]>
	<p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
<![endif]-->
<div class="body"> 
	<!-- Start Site Header -->
	<header class="site-header">
    	<div class="top-header hidden-xs">
        	<!--<div class="container">
            	<div class="row">
                	<div class="col-md-6">
                    	
						<div class="upcoming-event-bar">
                        	<h4><i class="fa fa-calendar"></i> Next Event</h4>
                            <div id="counter" class="counter" data-date="July 13, 2015">
                         		<div class="timer-col"> <span id="days"></span> <span class="timer-type">d</span> </div>
                        		<div class="timer-col"> <span id="hours"></span> <span class="timer-type">h</span> </div>
                      			<div class="timer-col"> <span id="minutes"></span> <span class="timer-type">m</span> </div>
                         		<div class="timer-col"> <span id="seconds"></span> <span class="timer-type">s</span> </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                    	<ul class="top-menu">
                        	<li><a href="donate.html">Donate Now</a></li>
                        	<li class="secondary"><a href="join.html">Join Us</a></li>
                        </ul>
                    	<ul class="social-links social-links-lighter">
                        	<li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                        	<li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
                        	<li><a href="#"><i class="fa fa-youtube-square"></i></a></li>
                        	<li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
           	</div>
			-->
       	</div>
    	<div class="lower-header">
        	<div class="container for-navi">
             	<h1 class="logo">
                	<a href="index.php"><img src="images/logo.png" alt="Site Logo"></a>
             	</h1>
              	<!-- Main Navigation -->
              	<nav class="main-navigation">
                  	<ul class="sf-menu">
                   		<li><a href="index.php">首 頁</a></li>
      					<li><a href="index.php?route=information/information">關於銘旺</a>
                            <ul>
                                <li><a href="index.php?route=information/information&information_id=1">關於我們</a></li>
                                <li><a href="index.php?route=information/information&information_id=2">公司簡介</a></li>
                                <li><a href="index.php?route=information/information&information_id=3">公司沿革</a></li>
                                <li><a href="index.php?route=information/information&information_id=4">集團架構</a></li>
                            </ul>
                        </li>
                        <li><a href="index.php?route=news/news">新聞專區</a>
                            <ul>
                                <li><a href="index.php?route=news/news&news_type_id=1">最新消息</a></li>
                                <li><a href="index.php?route=news/news&news_type_id=11">媒體報導</a></li>
                            </ul>
                        </li>
                        <li><a href="index.php?route=product/category">產品介紹</a></li>
                        <li><a href="index.php?route=information/clients">客戶品牌</a></li>
                        <li><a href="index.php?route=investor/investor">投資人專區</a>
                            <ul>
                                <li><a href="index.php?route=investor/directors">公司概況與治理</a>
                                    <ul>
                                        <li><a href="index.php?route=investor/directors">董事會</a></li>
                                        <li><a href="index.php?route=investor/committee">功能性委員會</a></li>
                                        <li><a href="index.php?route=investor/audit">內部稽核之組織及運作</a></li>
                                        <li><a href="index.php?route=investor/regulations">公司內部規章</a></li>
                                    </ul>
								</li>
                                <li><a href="index.php?route=investor/interests">財務概況</a>
                                    <ul>
                                        <li><a href="index.php?route=investor/interests">營業利益</a></li>
										<li><a href="index.php?route=investor/revenue">月營收報告</a></li>
                                        <li><a href="index.php?route=investor/statement">財務報表</a></li>
                                    </ul>   
								</li>
                                <li><a href="index.php?route=investor/stockprice">股東專欄</a>
                                    <ul>
                                        <li><a href="index.php?route=investor/stockprice">股價資訊</a></li>
                                        <li><a href="index.php?route=investor/dividend">股利資訊</a></li>
                                        <li><a href="index.php?route=investor/shareholders">股東會資料</a></li>
										<li><a href="index.php?route=investor/legal">法人說明會資料</a></li>

                                    </ul>
								</li>
                                <li><a href="index.php?route=investor/faq">利害關係人專區</a></li>
                            </ul>
                        </li>
                        <li><a href="index.php?route=information/contact">聯絡我們</a></li>
                    </ul>
                </nav>
                <!-- Mobile Menu Trigger Icon -->
                <a href="#" class="visible-sm visible-xs" id="menu-toggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
	</header>