<#--&lt;#&ndash;<aside class="left-side sidebar-offcanvas">&ndash;&gt;-->
<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/adminlte/dist/img/user2.jpg" class="img-circle">
            </div>
            <div class="pull-left info">
                <p>${(me.userName)!'游客'}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
          </span>
            </div>
        </form>

        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">主导航</li>
            <li>
                <a target="_self" href="/" >
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span> </i>
                </a>
            </li>
            <li>
                <a target="_self" href="/admin/dataDictionary/list">
                    <i class="fa fa-cog"></i> <span>配置管理</span> </i>
                </a>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-bar-chart-o"></i>
                    <span>Charts</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/chart/morris"><i class="fa fa-angle-double-right"></i> Morris</a></li>
                    <li><a href="/chart/chartjs"><i class="fa fa-angle-double-right"></i> ChartJs</a></li>
                    <li><a href="/chart/flot"><i class="fa fa-angle-double-right"></i> Flot</a></li>
                    <li><a href="/chart/inline"><i class="fa fa-angle-double-right"></i> Inline charts</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-envelope"></i>
                    <span>服务管理</span>
                    <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a target="navTab" href="/admin/security/list">
                            <i class="fa fa-list"></i>
                            <span>服务列表</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </section>
</aside>