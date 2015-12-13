# -*- coding: utf-8 -*-
import sys
import MySQLdb

from flask import Flask
from flask import render_template
from flask import url_for
from flask import redirect

from flask.ext.wtf import Form
from wtforms import StringField,IntegerField
from wtforms.validators import DataRequired

app = Flask(__name__)
app.config.from_object('config')


reload(sys)
sys.setdefaultencoding('utf-8')
conn = MySQLdb.connect("10.1.3.106","root","jiexian","risk",charset='utf8')
cursor = conn.cursor()

# 项目清单
class project_form(Form):
    project_name = StringField('project_name', validators=[DataRequired()])
    project_client = StringField('project_client', validators=[DataRequired()])
    new_project_id = StringField('new_project_id',validators=[DataRequired()])

# 系统清单
class system_form(Form):
    Project_id = StringField('project_id', validators=[DataRequired()])
    System_id = StringField('system_id', validators=[DataRequired()])
    System_name = StringField('system_name', validators=[DataRequired()])

# 资产清单
class asset_form(Form):
    Asset_id = StringField('asset_id', validators=[DataRequired()])
    Asset_name = StringField('asset_name')
    Asset_type = StringField('asset_type', validators=[DataRequired()])
    Asset_confidentiality = IntegerField('asset_c', validators=[DataRequired()])
    Asset_integrality = IntegerField('asset_i', validators=[DataRequired()])
    Asset_availability = IntegerField('asset_a', validators=[DataRequired()])

class vul_form(Form):
    Asset_id = StringField('asset_id', validators=[DataRequired()])
    Vul_id = StringField('vul_id', validators=[DataRequired()])
    Vul_content = StringField('vul_content')
    Vul_level = IntegerField('vul_level', validators=[DataRequired()])

class threat_possible(Form):
    THR_1 = IntegerField('thr-01', validators=[DataRequired()])
    THR_2 = IntegerField('thr-02', validators=[DataRequired()])
    THR_3 = IntegerField('thr-03', validators=[DataRequired()])
    THR_4 = IntegerField('thr-04', validators=[DataRequired()])
    THR_5 = IntegerField('thr-05', validators=[DataRequired()])
    THR_6 = IntegerField('thr-06', validators=[DataRequired()])
    THR_7 = IntegerField('thr-07', validators=[DataRequired()])
    THR_8 = IntegerField('thr-08', validators=[DataRequired()])
    THR_9 = IntegerField('thr-09', validators=[DataRequired()])
    THR_10 = IntegerField('thr-10', validators=[DataRequired()])
    THR_11 = IntegerField('thr-11', validators=[DataRequired()])

class threat_form(Form):
    Asset_id = StringField('asset_id', validators=[DataRequired()])
    THR_1 = IntegerField('thr-01', validators=[DataRequired()])
    THR_2 = IntegerField('thr-02', validators=[DataRequired()])
    THR_3 = IntegerField('thr-03', validators=[DataRequired()])
    THR_4 = IntegerField('thr-04', validators=[DataRequired()])
    THR_5 = IntegerField('thr-05', validators=[DataRequired()])
    THR_6 = IntegerField('thr-06', validators=[DataRequired()])
    THR_7 = IntegerField('thr-07', validators=[DataRequired()])
    THR_8 = IntegerField('thr-08', validators=[DataRequired()])
    THR_9 = IntegerField('thr-09', validators=[DataRequired()])
    THR_10 = IntegerField('thr-10', validators=[DataRequired()])
    THR_11 = IntegerField('thr-11', validators=[DataRequired()])

class mapping_form(Form):
    Asset_id = StringField('asset_id', validators=[DataRequired()])
    THR_id = StringField('thr_id', validators=[DataRequired()])
    Vul_id = StringField('vul-id', validators=[DataRequired()])

@app.route('/')
def index():
    return render_template('index.html', title='index')

@app.route('/project', methods=['GET','POST'])
def project():

    form = project_form()

    sql = "SELECT * FROM Project"
    cursor.execute(sql)
    result = cursor.fetchall()

    if form.is_submitted():
        sql = "INSERT INTO Project VALUES ('%s','%s','%s')" % (form.new_project_id.data,form.project_name.data,form.project_client.data)
        cursor.execute(sql)
        conn.commit()
        return redirect('/project')

    return render_template('project.html', title='Project', result=result, form=form)


@app.route('/project/<project_id>',methods=['GET','POST'])
def get_porject(project_id):
    sql = "SELECT * FROM Project WHERE Project_id='%s'" % (project_id)
    cursor.execute(sql)
    proj=cursor.fetchall()

    sql = "SELECT System_id,System_name from System WHERE Project_id='%s'" % (project_id)
    cursor.execute(sql)
    system=cursor.fetchall()

    form = system_form()

    if form.is_submitted():
        sql = "INSERT INTO System VALUES ('%s','%s','%s')" % (form.System_id.data, form.System_name.data, project_id)
        cursor.execute(sql)
        conn.commit()
        return redirect('/project/'+project_id)

    return render_template('project_detail.html', title='Project', result1=proj, result2=system, form=form, id=project_id)


@app.route('/project/<project_id>/<system_id>',methods=['GET','POST'])
def get_system(project_id , system_id):
    sql = "SELECT * FROM System WHERE System_id='%s'" % (system_id)
    cursor.execute(sql)
    system = cursor.fetchall()

    sql= "SELECT * FROM Assets WHERE System_id='%s'" % (system_id)
    cursor.execute(sql)
    assets= cursor.fetchall()

    form = asset_form()

    if form.is_submitted():
        asset_value = max(form.Asset_confidentiality.data, form.Asset_integrality.data, form.Asset_availability.data)

        sql = "INSERT INTO Assets VALUES ('%s','%s','%s','%s',%d,%d,%d,%d)" % (form.Asset_id.data,
                                                                               system_id,
                                                                               form.Asset_name.data,
                                                                               form.Asset_type.data,
                                                                               form.Asset_confidentiality.data,
                                                                               form.Asset_integrality.data,
                                                                               form.Asset_availability.data,
                                                                               asset_value
                                                                               )
        cursor.execute(sql)
        conn.commit()
        return redirect('/project/'+project_id+'/'+system_id)


    return render_template('asstes.html',title='资产信息录入',result1=system,result2=assets ,form=form , proj=project_id, sys=system_id)


@app.route('/vul')
def vul():
    sql = "SELECT * FROM System"
    cursor.execute(sql)
    system = cursor.fetchall()

    return render_template('vul.html', title='Vul', result=system,)

@app.route('/vul/<system_id>', methods=['GET','POST'])
def get_vul(system_id):

    sql = "select * from Vulnerability"
    cursor.execute(sql)
    assets_with_vul = cursor.fetchall()

    sql = "select Assets_id,Assets_name from Assets where System_id='%s'" % (system_id)
    #&&Assets_id NOT IN (select Assets_id from Vulnerability)
    cursor.execute(sql)
    assets = cursor.fetchall()

    form = vul_form()

    if form.is_submitted():
        sql = "INSERT INTO Vulnerability(Vul_id,Vul_content,Vul_level,Asset_id) VALUES ('%s','%s',%d,'%s')" % (form.Vul_id.data, form.Vul_content.data, form.Vul_level.data, form.Asset_id.data)

        cursor.execute(sql)
        conn.commit()
        return redirect('/vul/'+system_id)


    return render_template('vul_import.html', title='Vul_import', result1=assets_with_vul,result2=assets, form=form, id=system_id)


@app.route('/threat_possibility', methods=['GET', 'POST'])
def threat_possibility():
    form = threat_possible()

    if form.is_submitted():
        sql = "INSERT INTO Threat_possibility VALUES (%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d)" % \
              (form.THR_1.data, form.THR_2.data, form.THR_3.data, form.THR_4.data, form.THR_5.data,
               form.THR_6.data, form.THR_7.data, form.THR_8.data, form.THR_9.data, form.THR_10.data,
               form.THR_11.data)
        cursor.execute(sql)
        conn.commit()
        return redirect('/threat')

    return render_template('threat_possibility.html', title='Threat_possibility', form=form)


@app.route('/threat')
def threat():
    sql = "SELECT * FROM System"
    cursor.execute(sql)
    system=cursor.fetchall()

    return render_template('threat.html', title='System choose',result=system)

@app.route('/threat/<system_id>',methods=['GET','POST'])
def threat_import(system_id):
    sql = "SELECT Assets_id,Assets_name FROM Assets WHERE System_id = '%s'" % (system_id)
    cursor.execute(sql)
    result1=cursor.fetchall()

    sql = "SELECT * FROM Threat"
    cursor.execute(sql)
    result2= cursor.fetchall()

    sql = "SELECT * FROM Threat_possibility LIMIT 5"
    cursor.execute(sql)
    Threat_possible=cursor.fetchall()

    form = threat_form()

    Threat_mitrix = [[1,1,2,3,3],[1,1,2,3,4],[1,2,3,4,5],[2,3,4,5,5],[2,4,4,5,5]]

    if form.is_submitted():
        sql = "INSERT INTO Threat VALUES ('%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d)" % (
            form.Asset_id.data,
            form.THR_1.data,
            form.THR_2.data,
            form.THR_3.data,
            form.THR_4.data,
            form.THR_5.data,
            form.THR_6.data,
            form.THR_7.data,
            form.THR_8.data,
            form.THR_9.data,
            form.THR_10.data,
            form.THR_11.data
        )
        cursor.execute(sql)
        Threat_level=(form.THR_1.data,
                      form.THR_2.data,
                      form.THR_3.data,
                      form.THR_4.data,
                      form.THR_5.data,
                      form.THR_6.data,
                      form.THR_7.data,
                      form.THR_8.data,
                      form.THR_9.data,
                      form.THR_10.data,
                      form.THR_11.data
        )

        Threar_value = [0,0,0,0,0,0,0,0,0,0,0]

        for i in range(0, 11):
            x = int(Threat_level[i])-1
            y = int(Threat_possible[0][i])-1
            value = int(Threat_mitrix[y][x])
            Threar_value.insert(i,value)

        sql="INSERT INTO Threat_value VALUES ('%s',%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d)" % (
            form.Asset_id.data,Threar_value[0],Threar_value[1],Threar_value[2],Threar_value[3],Threar_value[4],
            Threar_value[5],Threar_value[6],Threar_value[7],Threar_value[8],Threar_value[9],Threar_value[10]
        )
        cursor.execute(sql)

        conn.commit()
        return  redirect('/threat/'+system_id)

    return render_template('threat_import.html', title='Threat_import',result1=result1,result2=result2,form=form,id=system_id)

@app.route('/mapping',methods=['GET','POST'])
def mapping():
    sql = "select * from Mapping ORDER BY Asset_id,Vul_id,Thread_id"
    cursor.execute(sql)
    map = cursor.fetchall()

    sql = "select Threat_id,Threat_type from Threat_type"
    cursor.execute(sql)
    threat = cursor.fetchall()

    sql = "select Asset_id,Vul_id,Vul_content from Vulnerability"
    cursor.execute(sql)
    vul = cursor.fetchall()

    form = mapping_form()
    if form.is_submitted():
        sql = "INSERT INTO Mapping VALUES('%s','%s','%s')" % (form.Asset_id.data,form.Vul_id.data,form.THR_id.data)
        cursor.execute(sql)

        conn.commit()
        return redirect('/mapping')

    return render_template('mapping.html',title='mapping',result=map,form=form,map=map,threat=threat,vul=vul)

@app.route('/report')
def report():
    #资产赋值表生成
    sql = "SELECT Assets_id,Assets_name,Assets_type,confidentiality,availability,integrality,Assets_value FROM Assets"
    cursor.execute(sql)
    Assets_Value = cursor.fetchall()

    #威胁赋值表生成
    sql = "SELECT * FROM Threat"
    cursor.execute(sql)
    Threat = cursor.fetchall()

    sql = "SELECT * FROM Threat_possibility"
    cursor.execute(sql)
    Threat_possibility=cursor.fetchall()

    sql = "SELECT * FROM Threat_value"
    cursor.execute(sql)
    Threat_value = cursor.fetchall()

    #脆弱性赋值表生成
    sql = "SELECT * FROM Vulnerability"
    cursor.execute(sql)
    Vul = cursor.fetchall()

    #风险值计算总表
    sql = "SELECT * FROM Mapping"
    cursor.execute(sql)
    map = cursor.fetchall()

    for row in map:
        sql = "SELECT `%s` FROM Threat WHERE Asset_id='%s'" % (row[2],row[0])
        cursor.execute(sql)
        Act_threat=cursor.fetchall()

        sql = "SELECT Vul_id,Vul_level FROM Vulnerability WHERE Asset_id='%s'" % (row[0])
        cursor.execute(sql)
        Act_vul=cursor.fetchall()

        sql = "SELECT Assets_value FROM Assets where Assets_id= '%s'" % (row[0])
        cursor.execute(sql)
        Act_Value=cursor.fetchall()

        sql = "INSERT INTO RISK VALUES('%s',%d,'%s',%d,'%s','%s',%d,%d,%d)" % (
            row[0],
            Act_Value[0][0],
            Act_vul[0][0],
            Act_vul[0][1],
            row[2],
            Act_threat[0][0],
            Act_threat[0][0] * Act_vul[0][1],
            Act_Value[0][0] * Act_vul[0][1],
            0
        )
        #(Asset_id,Asset_value,Vul_id,Vul_level,Threat_id,Threat_level,TV,AV,R)
        cursor.execute(sql)

        sql = "update RISK set R=TV*AV"
        cursor.execute(sql)
    conn.commit()

    sql = "select * from RISK"
    cursor.execute(sql)
    R=cursor.fetchall()

    return render_template('report.html',title='Report',Assets_Value=Assets_Value,Threat=Threat,Vul=Vul,Threat_possibility=Threat_possibility,Threat_value=Threat_value,Risk=R)

@app.route('/delete')
def delete():
    sql = "TRUNCATE Vulnerability"
    cursor.execute(sql)

    sql ="TRUNCATE Project"
    cursor.execute(sql)

    sql ="TRUNCATE System"
    cursor.execute(sql)

    sql ="TRUNCATE Assets"
    cursor.execute(sql)

    sql ="TRUNCATE Threat"
    cursor.execute(sql)

    sql ="TRUNCATE Threat_value"
    cursor.execute(sql)

    sql ="TRUNCATE Mapping"
    cursor.execute(sql)

    sql ="TRUNCATE Threat_possibility"
    cursor.execute(sql)

    sql ="TRUNCATE RISK"
    cursor.execute(sql)


    return redirect('/')

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0')




cursor.close()
conn.close()