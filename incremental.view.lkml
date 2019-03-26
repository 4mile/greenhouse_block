view: incremental {
  sql_table_name: WORKSPACE_1155666.out.c-master-table.wrike_incremental ;;

  dimension_group: _timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."_timestamp" ;;
  }

  dimension: approveddate {
    type: string
    sql: ${TABLE}."approveddate" ;;
  }

  dimension: budgeted {
    type: string
    sql: ${TABLE}."budgeted" ;;
  }

  dimension: candidateapplicationdate {
    type: string
    sql: ${TABLE}."candidateapplicationdate" ;;
  }

  dimension: candidateassessmentinvite1 {
    type: string
    sql: ${TABLE}."candidateassessmentinvite1" ;;
  }

  dimension: candidateassessmentresults1 {
    type: string
    sql: ${TABLE}."candidateassessmentresults1" ;;
  }

  dimension: candidateassessmentresults2 {
    type: string
    sql: ${TABLE}."candidateassessmentresults2" ;;
  }

  dimension: candidatedispositiondate {
    type: string
    sql: ${TABLE}."candidatedispositiondate" ;;
  }

  dimension: candidateemail {
    type: string
    sql: ${TABLE}."candidateemail" ;;
  }

  dimension: candidateexperiencelevel {
    type: string
    sql: ${TABLE}."candidateexperiencelevel" ;;
  }

  dimension: candidatefirstname {
    type: string
    sql: ${TABLE}."candidatefirstname" ;;
  }

  dimension: candidatefirstviewed {
    type: string
    sql: ${TABLE}."candidatefirstviewed" ;;
  }

  dimension: candidatelastname {
    type: string
    sql: ${TABLE}."candidatelastname" ;;
  }

  dimension: candidatenoshow {
    type: string
    sql: ${TABLE}."candidatenoshow" ;;
  }

  dimension: candidateothersource {
    type: string
    sql: ${TABLE}."candidateothersource" ;;
  }

  dimension: candidatepreferredname {
    type: string
    sql: ${TABLE}."candidatepreferredname" ;;
  }

  dimension: candidatereferralsource {
    type: string
    sql: ${TABLE}."candidatereferralsource" ;;
  }

  dimension: candidaterejectreason {
    type: string
    sql: ${TABLE}."candidaterejectreason" ;;
  }

  dimension: candidatesourced {
    type: string
    sql: ${TABLE}."candidatesourced" ;;
  }

  dimension: candidatestage {
    type: string
    sql: ${TABLE}."candidatestage" ;;
  }

  dimension: candidatestatus {
    type: string
    sql: ${TABLE}."candidatestatus" ;;
  }

  dimension: ccat1rawscore {
    type: string
    sql: ${TABLE}."ccat1rawscore" ;;
  }

  dimension: ccat2rawscore {
    type: string
    sql: ${TABLE}."ccat2rawscore" ;;
  }

  dimension: companyid {
    type: string
    sql: ${TABLE}."companyid" ;;
  }

  dimension: companyname {
    type: string
    sql: ${TABLE}."companyname" ;;
  }

  dimension: createdate {
    type: string
    sql: ${TABLE}."createdate" ;;
  }

  dimension: csapscoreband {
    type: string
    sql: ${TABLE}."csapscoreband" ;;
  }

  dimension: currencytype {
    type: string
    sql: ${TABLE}."currencytype" ;;
  }

  dimension: deptinterviewdate {
    type: string
    sql: ${TABLE}."deptinterviewdate" ;;
  }

  dimension: epp {
    type: string
    sql: ${TABLE}."EPP" ;;
  }

  dimension: hirebase {
    type: string
    sql: ${TABLE}."hirebase" ;;
  }

  dimension: hirebonus {
    type: string
    sql: ${TABLE}."hirebonus" ;;
  }

  dimension: hirecommissiontarget {
    type: string
    sql: ${TABLE}."hirecommissiontarget" ;;
  }

  dimension: hiredate {
    type: string
    sql: ${TABLE}."hiredate" ;;
  }

  dimension: hirehourly {
    type: string
    sql: ${TABLE}."hirehourly" ;;
  }

  dimension: hiretype {
    type: string
    sql: ${TABLE}."hiretype" ;;
  }

  dimension: hiringmanageremail {
    type: string
    sql: ${TABLE}."hiringmanageremail" ;;
  }

  dimension: hiringmanagerfirstname {
    type: string
    sql: ${TABLE}."hiringmanagerfirstname" ;;
  }

  dimension: hiringmanagerlastname {
    type: string
    sql: ${TABLE}."hiringmanagerlastname" ;;
  }

  dimension: hrinterviewdate {
    type: string
    sql: ${TABLE}."hrinterviewdate" ;;
  }

  dimension: jobid {
    type: string
    sql: ${TABLE}."jobid" ;;
  }

  dimension: jobstatus {
    type: string
    sql: ${TABLE}."jobstatus" ;;
  }

  dimension: jobtitle {
    type: string
    sql: ${TABLE}."jobtitle" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."Location" ;;
  }

  dimension: offeraccepteddate {
    type: string
    sql: ${TABLE}."offeraccepteddate" ;;
  }

  dimension: offerdate {
    type: string
    sql: ${TABLE}."offerdate" ;;
  }

  dimension: offerextendeddate {
    type: string
    sql: ${TABLE}."offerextendeddate" ;;
  }

  dimension: offerrejectreason {
    type: string
    sql: ${TABLE}."offerrejectreason" ;;
  }

  dimension: offerstatus {
    type: string
    sql: ${TABLE}."offerstatus" ;;
  }

  dimension: offertype {
    type: string
    sql: ${TABLE}."offertype" ;;
  }

  dimension: pipelinereq {
    type: string
    sql: ${TABLE}."pipelinereq" ;;
  }

  dimension: publisheddate {
    type: string
    sql: ${TABLE}."publisheddate" ;;
  }

  dimension: recruiteremail {
    type: string
    sql: ${TABLE}."recruiteremail" ;;
  }

  dimension: recruiterfirstname {
    type: string
    sql: ${TABLE}."recruiterfirstname" ;;
  }

  dimension: recruiterlastname {
    type: string
    sql: ${TABLE}."recruiterlastname" ;;
  }

  dimension: reqcategory {
    type: string
    sql: ${TABLE}."reqcategory" ;;
  }

  dimension: reqdepartment {
    type: string
    sql: ${TABLE}."reqdepartment" ;;
  }

  dimension: reqlevel {
    type: string
    sql: ${TABLE}."reqlevel" ;;
  }

  dimension: reqtype {
    type: string
    sql: ${TABLE}."reqtype" ;;
  }

  dimension: requisitionclosedate {
    type: string
    sql: ${TABLE}."requisitionclosedate" ;;
  }

  dimension: requisitionfilled {
    type: string
    sql: ${TABLE}."requisitionfilled" ;;
  }

  dimension: salesapscoreband {
    type: string
    sql: ${TABLE}."salesapscoreband" ;;
  }

  dimension: startdate {
    type: string
    sql: ${TABLE}."startdate" ;;
  }

  dimension: testingcomplete {
    type: string
    sql: ${TABLE}."testingcomplete" ;;
  }

  dimension: ucat1rawscore {
    type: string
    sql: ${TABLE}."ucat1rawscore" ;;
  }

  dimension: ucat2rawscore {
    type: string
    sql: ${TABLE}."ucat2rawscore" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      recruiterlastname,
      recruiterfirstname,
      hiringmanagerfirstname,
      hiringmanagerlastname,
      candidatefirstname,
      candidatelastname,
      candidatepreferredname,
      companyname
    ]
  }
}
