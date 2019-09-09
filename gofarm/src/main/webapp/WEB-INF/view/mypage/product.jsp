<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이페이지 - 판매</title>

 <!-- Custom fonts for this template-->
  <link href="mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="mypage/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>판매
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>번호</th>
                    <th>상품명</th>
                    <th>판매가</th>
                    <th>상품수량</th>
                    <th>제품정보</th>
                    <th>아무거나</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                 	<th>번호</th>
                    <th>상품명</th>
                    <th>판매가</th>
                    <th>상품수량</th>
                    <th>제품정보</th>
                    <th>아무거나</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                  	<th>1</th>
                    <td>이천쌀</td>
                    <td>40,000</td>
                    <td>100</td>
                    <td>ㅁ뇌ㅏ러마ㅣ런미</td>
                    <td>2011/04/25</td>
                  </tr>
                  <tr>
                  	<th>2</th>
                    <td>오대쌀</td>
                    <td>50,000</td>
                    <td>100</td>
                    <td>ㅁ뇌ㅏ러마ㅣ런미</td>
                    <td>2011/05/16</td>
                  </tr>
                  </tr>
                  <tr>
                  	<th>3</th>
                    <td>꿀사과</td>
                    <td>10,000</td>
                    <td>1000</td>
                    <td>ㅁ뇌ㅏ러마ㅣ런미</td>
                    <td>2011/05/20</td>
                  </tr>
                  <tr>
                 	<th>4</th>
                    <td>Ashton Cox</td>
                    <td>Junior Technical Author</td>
                    <td>San Francisco</td>
                    <td>66</td>
                    <td>2009/01/12</td>
                  </tr>
                  <tr>
                  	<th>5</th>
                    <td>Airi Satou</td>
                    <td>Accountant</td>
                    <td>Tokyo</td>
                    <td>33</td>
                    <td>2008/11/28</td>
                  </tr>
                  <tr>
                  	<th>6</th>
                    <td>Integration Specialist</td>
                    <td>New York</td>
                    <td>61</td>
                    <td>$372,000</td>
                    <td>2012/12/02</td>
                  </tr>
                  <tr>
                  	<th>7</th>
                    <td>Sales Assistant</td>
                    <td>San Francisco</td>
                    <td>59</td>
                    <td>$137,500</td>
                    <td>2012/08/06</td>
                  </tr>
                  <tr>
                  	<th>8</th>
                    <td>Integration Specialist</td>
                    <td>Tokyo</td>
                    <td>55</td>
                    <td>$327,900</td>
                    <td>2010/10/14</td>
                  </tr>
                  <tr>
                  	<th>9</th>
                    <td>Colleen Hurst</td>
                    <td>Javascript Developer</td>
                    <td>San Francisco</td>
                    <td>39</td>
                    <td>2009/09/15</td>
                  </tr>
                  <tr>
                  	<th>10</th>
                    <td>Software Engineer</td>
                    <td>Edinburgh</td>
                    <td>23</td>
                    <td>$103,600</td>
                    <td>2008/12/13</td>
                  </tr>
                  <tr>
                  	<th>11</th>
                    <td>Office Manager</td>
                    <td>London</td>
                    <td>30</td>
                    <td>$90,560</td>
                    <td>2008/12/19</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="mypage/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="mypage/vendor/datatables/jquery.dataTables.js"></script>
  <script src="mypage/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="mypage/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="mypage/js/demo/datatables-demo.js"></script>

</body>

</html>
