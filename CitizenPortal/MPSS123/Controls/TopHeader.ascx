<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopHeader.ascx.cs" Inherits="CitizenPortal.MPSS.Controls.TopHeader" %>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 topband">
    <div class="row">
        <div class="col-xs-12 col-sm-5 col-md-6 col-lg-6">
            <div class="topband-leftlinks">
                <ul class="list-inline">
                    <li><a href="javascript:void(0);" class="reducefnt decrease">A-</a>
                    </li>
                    <li><a href="javascript:void(0);" class="resizefnt resetMe">A</a>
                    </li>
                    <li><a href="javascript:void(0);" onclick="Inc();" class="increasefnt increase">A+</a>
                    </li>
                    <li>
                        <select name="chooselang" id="chooselang" class="drpdwn-chngelng">
                            <option value="1">English</option>
                            <option value="2">Hindi</option>
                        </select>
                    </li>
                    <li class="hidecntnt"><a href="#">Skip to Navigation</a> </li>
                    <li class="hidecntnt"><a href="#">Skip to Content</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6 topband-rightlinks">
            

            <div class="col-xs-6 col-sm-3  col-md-3 col-lg-3 pleft0">
                <a href="/Account/Login">
                    <div class="topbtn signin">
                        <i class="fa fa-user fa-fw"></i>SIGN IN
                               
                    </div>
                </a>
            </div>

        </div>
    </div>

</div>
