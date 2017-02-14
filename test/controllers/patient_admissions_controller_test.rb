require 'test_helper'

class PatientAdmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_admissions_index_url
    assert_response :success
  end

  test "should get new" do
    get patient_admissions_new_url
    assert_response :success
  end

  test "should get show" do
    get patient_admissions_show_url
    assert_response :success
  end

  test "should get edit" do
    get patient_admissions_edit_url
    assert_response :success
  end

  test "should get update" do
    get patient_admissions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get patient_admissions_destroy_url
    assert_response :success
  end

end
