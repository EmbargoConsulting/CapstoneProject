<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 offset-3 float-md-center">
            <div class="jumbotron" style="background-image:url(https://cdn.cssauthor.com/wp-content/uploads/2015/10/Fine-Wood-Textures-1.jpg); font-size:x-large; color:orange" >
                <h1 style="text-align:center">LOGON</h1>
                <img src="https://pbs.twimg.com/profile_images/2511992016/3cjz9awq6dvjr41kqiie_400x400.jpeg" class="img-responsive align-content-center" alt="Wildlife Center"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="form-group-input">Username</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputUsername" placeholder="Username"/>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="form-group-input">Password</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputPassword" placeholder="Password"/>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </form>
</body>
</html>
