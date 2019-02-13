<!DOCTYPE html>
<html>
<head>
	<title>All Branches</title>
</head>
<body>
<?php 
  $id = $_GET['id'];
  $teacherAssignDetail = Yii::$app->db->createCommand("SELECT tsah.teacher_subject_assign_head_name,tsad.class_id,tsad.subject_id,tsad.no_of_lecture
FROM teacher_subject_assign_detail as tsad
INNER JOIN teacher_subject_assign_head as tsah
ON tsah.teacher_subject_assign_head_id = tsad.teacher_subject_assign_detail_head_id
WHERE tsad.teacher_subject_assign_detail_head_id = '$id'")->queryAll();

 $teacherName       = $teacherAssignDetail[0]['teacher_subject_assign_head_name'];
 $teacherSubjectId  = $teacherAssignDetail[0]['subject_id'];
 $teacherClassId    = $teacherAssignDetail[0]['class_id'];
 $teacherLectures   = $teacherAssignDetail[0]['no_of_lecture'];

  // get `class names` from `std_class` against  `$teacherClassId`

  $teacherClassNames = Yii::$app->db->createCommand("SELECT class_name FROM std_class WHERE class_id = '$teacherClassId'")->queryAll();

  // get `subjects name` from `std_subjects` against  `$teacherSubjectId`

  $teacherSubjectName = Yii::$app->db->createCommand("SELECT subject_name FROM subjects WHERE subject_id = '$teacherSubjectId'")->queryAll();


?>
<div class="container-fluid">
	<section class="content-header">
      	<h1 style="color: #3C8DBC;">
        	<i class="fa fa-copyright"></i>
          <?php echo $teacherName." - Information" ; ?>
      	</h1>
	    <ol class="breadcrumb" style="color: #3C8DBC;">
	        <li><a href="index.php" style="color: #3C8DBC;"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="index.php?r=std-enrollment-head" style="color: #3C8DBC;">Back</a></li>
	    </ol>
    </section>
    <!--  -->
	<section class="content">
      <div class="row">
        <!-- /.col -->
        <div class="col-md-12">
          <table class="table table-bordered table-hover table-condensed table-striped">
            <thead>
              <tr class="label-primary">
                <th style="width: 60px; text-align: center;">Sr #</th>
                <th style="width: 200px">Class</th>
                <th style="width: 200px">Subject</th>
                <th>Lectures</th>
              </tr>
            </thead>
            <tbody>
              <?php 
                foreach ($teacherAssignDetail as $key => $value){
                  foreach ($teacherClassNames as $clas => $class){
                    foreach ($teacherSubjectName as $sub => $subject){
              ?>
              <tr>
                <td align="center"><b><?php echo $key+1; ?></b></td>
                <td><?php echo $class['class_name']; ?></td>
                <td><?php echo $subject['subject_name']; ?></td>
                <td><?php echo $value['no_of_lecture'];?></td>
              </tr>
              <?php }
              }} ?>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!--  -->
</div>	
</body>
</html>