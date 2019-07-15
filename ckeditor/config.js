/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config
	 var url = location.href.substr(0,location.href.indexOf('index.php'));
	 var token = location.href.substr(location.href.indexOf('token'));
      config.baseHref = url.replace("admin/", "");
      config.allowedContent=true;
	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'others' },
 		{ name: 'tools' },
	];
	
 
	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
 	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.filebrowserBrowseUrl =  config.baseHref+'ckeditor/ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl =  config.baseHref+'ckeditor/ckfinder/ckfinder.html?Type=Images';
	config.filebrowserFlashBrowseUrl =  config.baseHref+'ckeditor/ckfinder/ckfinder.html?Type=Flash';
	config.filebrowserUploadUrl =  config.baseHref+'ckeditor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'; //可上傳一般檔案
	config.filebrowserImageUploadUrl = config.baseHref+'ckeditor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';//可上傳圖檔
	config.filebrowserFlashUploadUrl =  config.baseHref+'ckeditor/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';//可上傳Flash檔 

};
