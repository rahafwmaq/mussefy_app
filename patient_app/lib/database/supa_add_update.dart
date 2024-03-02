import 'package:mussefy_app/models/EmergencyContact_model.dart';
import 'package:mussefy_app/models/MedicalInformation_model.dart';
import 'package:mussefy_app/models/MobilityProblem_model.dart';
import 'package:mussefy_app/models/PersonalInfo_model.dart';
import 'package:mussefy_app/models/XRay_model.dart';
import 'package:mussefy_app/models/allergies_model.dart';
import 'package:mussefy_app/models/chronic_disease_model.dart';
import 'package:mussefy_app/models/doctor_model.dart';
import 'package:mussefy_app/models/insurance_model.dart';
import 'package:mussefy_app/models/medications_model.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/models/surgery_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaAddAndUpdate {
  final supabase = Supabase.instance.client;

  // -------------------ADD---------------------------------------------------

  addPatientToDatabase({required Patient patient}) async {
    print("got here");
    try {
      final response = await supabase.from('patients').insert(patient.toJson());
    } catch (error) {
      print(error.toString());
    }
  }

  addChronicDisease(
      {required String patientId, required ChronicDisease body}) async {
    try {
      final response = await supabase
          .from('chronic_diseases')
          .insert([body.toJson()]).select();
      print(response[0]['id']);
      if (response[0]['id'] != null) {
        final response2 = await supabase.rpc('insert_patient_chronic_disease',
            params: {
              'patient_idf': patientId,
              'disease_idf': response[0]['id']
            });
      }
    } catch (error) {
      print(error.toString());
    }
  }

  addPatientPersonalInformation(
      {required PersonalInfo personalInfo, required Patient patient}) async {
    try {
      final response = await supabase.from('personal_information').insert({
        'national_id': personalInfo.nationalId,
        'weight': personalInfo.weight,
        'height': personalInfo.height,
        'birthday': personalInfo.birthday,
        'blood_type': personalInfo.bloodType,
        'image': personalInfo.image
      }).select();
      patient.personalInformationId = response[0]['id'];

      final addID = await supabase
          .from('patients')
          .update(patient.toJson())
          .eq('id', patient.id!)
          .select();
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  addInsurance(
      {required InsuranceModel insurance, required Patient patient}) async {
    try {
      final response =
          await supabase.from('insurance').insert(insurance.toMap()).select();
      patient.insuranceId = response[0]['id'];
      final response2 = await supabase
          .from('patients')
          .update(patient.toJson())
          .eq('id', patient.id!)
          .select();
      print(response2);
    } catch (error) {
      print(error.toString());
    }
  }

  addDoctor({required Doctor doctor, required Patient patient}) async {
    try {
      final response =
          await supabase.from('doctors').insert(doctor.toMap()).select();
      patient.doctorId = response[0]['id'];
      final response2 = await supabase
          .from('patients')
          .update(patient.toJson())
          .eq('id', patient.id!)
          .select();
      print(response2);
    } catch (error) {
      print(error.toString());
    }
  }

  addMedicalInformation(
      {required MedicalInformation medicalInformation,
      required Patient patient}) async {
    print("in addMedicalInformation ");
    try {
      final response = await supabase
          .from('medical_information')
          .insert(medicalInformation.toMap())
          .select();
      patient.medicalInformationId = response[0]['id'];
      final response2 = await supabase
          .from('patients')
          .update(patient.toJson())
          .eq('id', patient.id!)
          .select();
      print(response2);
    } catch (error) {
      print(error.toString());
    }
  }

  addMobilityProblem({required MobilityProblem problem}) async {
    try {
      final response = await supabase
          .from('mobility_problems')
          .insert(problem.toMap())
          .select();
      print(response);
    } catch (error) {
      print('Errrrooorr   :   ${error.toString()}');
    }
  }

  addMedication({required Medication medication}) async {
    try {
      final response = await supabase
          .from('medications')
          .insert(medication.toMap())
          .select();
    } catch (error) {
      print(error.toString());
    }
  }

  addAllergiens(
      {required Allergies allergies, required Patient patient}) async {
    try {
      final response = await supabase.from('allergies').insert({
        'allergies_name': allergies.allergiesName,
        'patient_id': patient.id
      }).select();
    } catch (error) {
      print(error.toString());
    }
  }

  addEmergencyContact(
      {required EmergencyContact emergencyContact,
      required Patient patient}) async {
    try {
      final response = await supabase.from('emergency_contacts').insert({
        'name': emergencyContact.name,
        'phone_number': emergencyContact.phoneNumber,
        'relationship_to_patient': emergencyContact.relationshipType,
        'patient_id': patient.id
      }).select();
      return response;
    } catch (error) {
      print(error.toString());
    }
  }

  addXray({required XRay xray}) async {
    try {
      final response =
          await supabase.from('xrays').insert(xray.toMap()).select();
    } catch (error) {
      print(error.toString());
    }
  }

  addSergury({required SurgeryModel surgery}) async {
    try {
      await supabase.from('surgeries').insert(surgery.toJson()).select();
    } catch (error) {
      print(error.toString());
    }
  }

  //--------------update----------------------------------------------------
  updateMedicalInformation(
      {required MedicalInformation medicalInformation}) async {
    try {
      final response2 = await supabase
          .from('medical_information')
          .update(medicalInformation.toMap())
          .eq('id', medicalInformation.id!)
          .select();
      print(response2);
    } catch (error) {
      print(error.toString());
    }
  }

  updateDoctor({required Doctor doctor}) async {
    try {
      final response2 = await supabase
          .from('doctors')
          .upsert(doctor.toMap())
          .eq('id', doctor.id!)
          .select();
      print(response2);
    } catch (error) {
      print(error.toString());
    }
  }

  updateInsurance(
      {required InsuranceModel insurance, required String insuranceID}) async {
    try {
      print('the new id for patient${insurance.patientInsuranceId}');
      print('the new statues for patient${insurance.status}');

      print('the new statues for id  --- ${insurance.id}');
      print('************ iam here in supa udate insurence *************');
      final response2 = await supabase
          .from('insurance')
          .update(insurance.toMap())
          .eq('id', insuranceID)
          .select();
      print(response2);

      // return response2[0];
    } catch (error) {
      print('Errrrrorrrr : ${error.toString()}');
    }
  }

  updateXray({required XRay xray}) async {
    try {
      final response = await supabase
          .from('xrays')
          .update(xray.toMap())
          .eq('id', xray.id!)
          .select();
    } catch (error) {
      print(error.toString());
    }
  }

  updateMedication({required Medication medication}) async {
    try {
      final response = await supabase
          .from('medications')
          .update(medication.toMap())
          .eq('id', medication.id!)
          .select();
    } catch (error) {
      print(error.toString());
    }
  }

  updateMobilityProblem({required MobilityProblem problem}) async {
    try {
      final response = await supabase
          .from('mobility_problems')
          .update(problem.toMap())
          .eq('id', problem.id!)
          .select();
    } catch (error) {
      print(error.toString());
    }
  }

  updateSergury({required SurgeryModel surgery}) async {
    try {
      final response = await supabase
          .from('surgeries')
          .update(surgery.toJson())
          .eq('id', surgery.id!)
          .select();
    } catch (error) {
      print(error.toString());
    }
  }

  updatePatientPersonalInformation({required PersonalInfo personalInfo}) async {
    try {
      final response = await supabase
          .from('personal_information')
          .update({
            'national_id': personalInfo.nationalId,
            'weight': personalInfo.weight,
            'height': personalInfo.height,
            'birthday': personalInfo.birthday,
            'blood_type': personalInfo.bloodType,
            'image': personalInfo.image
          })
          .eq('id', personalInfo.id!)
          .select();
    } catch (error) {
      print(error.toString());
    }
  }
}
