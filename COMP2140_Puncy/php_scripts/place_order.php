<!DOCTYPE html>
<?php
    include 'header.php';
?>
<html>
    <head>
        <title>Order Form</title>
        <link rel = "stylesheet" href = "../templates/order_form/css/styles.css"/>
        <srcipt src = "jquery-3.2.1.min.js"></srcipt>
        <script src = "../templates/order_form/js/script.js"></script>
        <!--TEMPLATE FROM: https://mdbootstrap.com/snippets/jquery/pjoter-2-0/747937 -->
    </head>
    <body>
        <section class="order-form my-4 mx-4">
            <div class="container pt-4">

              <div class="row">
                <div class="col-12">
                  <h1>Place a Custom Job Order</h1>
                  <span><i>*Note, jobs with less than 10 days before their due date incur extra charge.</i></span>
                  <hr class="mt-1">
                </div>
                <div class="col-12">

                  <div class="row mx-4">
                    <div class="col-12 mb-2">
                      <label class="order-form-label">Name</label>
                    </div>
                    <div class="col-12 col-sm-6">
                      <input class="order-form-input" placeholder="First">
                    </div>
                    <div class="col-12 col-sm-6 mt-2 mt-sm-0">
                      <input class="order-form-input" placeholder="Last">
                    </div>
                  </div>

                  <div class="row mt-3 mx-4">
                    <div class="col-12">
                      <label class="order-form-label">Type of thing you want to order</label>
                    </div>
                    <div class="col-12">
                      <select name = "job-type" class = "order-form-input">
                        <?php
                          $sql = "select preset_id, type from job_presets order by preset_id ASC;";
                          $conn->prepare($sql);
                          $jobs = $conn->query($sql);
                          foreach($jobs as $job)
                          {
                              
                              $option = "<option value = '".$job['preset_id']."'>" .$job['type']. "</option>";
                              echo $option;
                          }
                        ?>
                      </select>
                    </div>
                  </div>

                  <div class="row mt-3 mx-4">
                    <div class="col-12">
                      <label class="order-form-label">Another type of thing you want to order</label>
                    </div>
                    <div class="col-12">
                      <input class="order-form-input" placeholder=" ">
                    </div>
                  </div>

                  <div class="row mt-3 mx-4">
                    <div class="col-12">
                      <label class="order-form-label" for="date-picker-example">Date</label>
                    </div>
                    <div class="col-12">
                      <input class="order-form-input datepicker" placeholder="Selected date" type="text"
                        id="date-picker-example">
                    </div>
                  </div>

                  <div class="row mt-3 mx-4">
                    <div class="col-12">
                      <label class="order-form-label">Adress</label>
                    </div>
                    <div class="col-12">
                      <input class="order-form-input" placeholder="Street Address">
                    </div>
                    <div class="col-12 mt-2">
                      <input class="order-form-input" placeholder="Street Address Line 2">
                    </div>
                    <div class="col-12 col-sm-6 mt-2 pr-sm-2">
                      <input class="order-form-input" placeholder="City">
                    </div>
                    <div class="col-12 col-sm-6 mt-2 pl-sm-0">
                      <input class="order-form-input" placeholder="Region">
                    </div>
                    <div class="col-12 col-sm-6 mt-2 pr-sm-2">
                      <input class="order-form-input" placeholder="Postal / Zip Code">
                    </div>
                    <div class="col-12 col-sm-6 mt-2 pl-sm-0">
                      <input class="order-form-input" placeholder="Country">
                    </div>
                  </div>

                  <div class="row mt-3 mx-4">
                    <div class="col-12">
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="validation" id="validation" value="1">
                        <label for="validation" class="form-check-label">I know what I need to know</label>
                      </div>
                    </div>
                  </div>

                  <div class="row mt-3">
                    <div class="col-12">
                      <button type="button" id="btnSubmit" class="btn btn-dark d-block mx-auto btn-submit">Submit</button>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </section>
    </body>
</html>
  
