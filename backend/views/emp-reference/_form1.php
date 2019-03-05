<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmpReference */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="emp-reference-form">
    <h3 class="well well-sm label-primary" style="margin-top: -10px;">Update Employee Reference Info</h3>
    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'emp_id')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'ref_name')->textInput(['maxlength' => true]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'ref_contact_no')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'ref_cnic')->textInput() ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'ref_designation')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

	<?php if (!Yii::$app->request->isAjax){ ?>
        <div class="row">
            <div class="col-md-1">
                <?= Html::submitButton($model->isNewRecord ? 'Create' : ' Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary btn-sm fa fa-edit']) ?>
            </div>
            <div class="col-md-1">
                <a href="./emp-info-view?id=<?php echo $model->emp_id; ?>" class="btn btn-warning btn-sm fa fa-step-backward"> Back</a>
            </div>
        </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
