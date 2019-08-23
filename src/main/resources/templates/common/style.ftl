<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="shortcut icon" type="image/x-icon" href="/adminlte/dist/img/favicon.ico">
	<!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/adminlte/dist/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/adminlte/dist/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/adminlte/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/adminlte/dist/css/skins/_all-skins.min.css"
	<!-- 以上为公共css -->

	<!-- daterange picker -->
    <link rel="stylesheet" href="/adminlte/plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="/adminlte/plugins/datepicker/datepicker3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="/adminlte/plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="/adminlte/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/adminlte/plugins/select2/select2.min.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/adminlte/plugins/iCheck/flat/blue.css">

    <!-- fullCalendar 2.2.5-->
    <link rel="stylesheet" href="/adminlte/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="/adminlte/plugins/fullcalendar/fullcalendar.print.css" media="print">

    <!-- Ion Slider -->
    <link rel="stylesheet" href="/adminlte/plugins/ionslider/ion.rangeSlider.css">
    <!-- ion slider Nice -->
    <link rel="stylesheet" href="/adminlte/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <!-- bootstrap slider -->
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap-slider/slider.css">

    <!-- Morris chart -->
    <link rel="stylesheet" href="/adminlte/plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.css">

	<script>
        function onClickCheckbox(clickName, target) {
            var status = false;
            if (document.getElementById(clickName).checked) {
                status = true;
            }
            var list = document.getElementsByName(target);
            for (var i = 0; i < list.length; i++) {
                list[i].checked = status;
            }
        }

        function iFrameHeight() {
            var ifm = document.getElementById("content");
            var subWeb = document.frames ? document.frames["content"].document : ifm.contentDocument;
            if (ifm != null && subWeb != null) {
                ifm.height = subWeb.body.scrollHeight;
            }
        }
    </script>