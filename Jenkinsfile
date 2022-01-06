node {
	properties([parameters([
		choice(name: 'Credential_ID', choices: ['', 'pangjj', 'wanglijun', 'yizhao', 'jenkins_xiemy'], description: 'Used to checkout the config files and source code.'),
		string(name: 'Xcode', defaultValue: 'Xcode_11_5', description: 'The default xcode which to build the sdk.'),
		string(name: 'Project', defaultValue: '', description: 'The target job name.'),
		string(name: 'Branch', defaultValue: '', description: 'The target branch name.'),
		string(name: 'Version', defaultValue: '', description: 'The target sdk version, such as v1.1.1.'),
		string(name: 'Framework', defaultValue: '', description: 'The framework name used to check.'),
		string(name: 'Config_Folder', defaultValue: '', description: 'The config files folder name.'),
		string(name: 'Bucket', defaultValue: '', description: 'The minio bucket name.'),
		string(name: 'Zip', defaultValue: '', description: 'The zip name, e.g. MobLinkPro_For_iOS_v3.3.11.zip'),
		string(name: 'Jira_Key', defaultValue: '', description: 'The requirements jira key.'),
		string(name: 'Config_Git_Url', defaultValue: 'git@gitlab.code.mob.com:pangjj/ios_cd_folders.git', description: 'This job config files.'),
		string(name: 'SourceCode_Git_Url', defaultValue: 'git@gitlab.code.mob.com:mobclub/secverify-for-ios.git', description: 'Source code git url.'),
		string(name: 'ProjectCode_Git_Url', defaultValue: 'git@gitlab.code.mob.com:androidteam/iosteam/project/secverify.git', description: 'Project code git url.')
	])])

	stage('Parameter Valid Check') {
		if (isEmpty(params.Jira_Key)) throw new Exception('Jira_Key was required to make sure this operation continue.')
	}

	String config_files_folder = "${WORKSPACE}/../Config_Files/SecVerify_Repo/${params.Branch}";
	stage('Checkout Config Files') {
		try {
			String target_folder_path = "/${params.Config_Folder}/*";
			checkout_target_git(params.Config_Git_Url, params.Branch, 'pangjj', target_folder_path, config_files_folder);
		} catch(Exception e) {
			println('Fetch Config Files Failed.');
			throw e;
		}
	}

	stage('Checkout Source Code') {
		try {
			checkout_target_git(params.SourceCode_Git_Url, params.Branch, params.Credential_ID);
		} catch(Exception e) {
			print("Checkout the target branch: ${branch} failed.");
			throw e;
		}
	}

	stage('Organize Config Files') {
		try {
			fileOperations([
				folderDeleteOperation (folderPath: "${config_files_folder}/${params.Config_Folder}/.git"),
				folderCopyOperation (sourceFolderPath: "${config_files_folder}/${params.Config_Folder}", destinationFolderPath: WORKSPACE)
			]);
		} catch(Exception e) {
			println('Organize config files failed.');
			throw e;
		}
	}

	stage('Select Xcode') {
		try {
			sh "echo xaf3kwpe | sudo -S xcode-select -s /Applications/${params.Xcode}.app";
		} catch(Exception e) {
			println('Change select xcode failed.')
			throw e
		}
	}

	stage('Configure Fastlane Envrionment') {
		sh 'bundle install && bundle update'
	}

	String project_folder = "${WORKSPACE}/../${params.Project}";
	stage('Checkout Project Source Code') {
		try {
			checkout_target_git(params.ProjectCode_Git_Url, params.Branch, params.Credential_ID, '/*', project_folder);
		} catch(Exception e) {
			print("Checkout the target branch: ${branch} failed.");
			throw e;
		}
	}

	stage('Operational Legitimacy') {
		sh "bundle exec fastlane check_operation_legal project:${params.Project} branch:${params.Branch} version:${params.Version} framework:${params.Framework}"
	}

	stage('Add Tag To Project') {
		sh "bundle exec fastlane add_tag_to_project_branch project:${params.Project} branch:${params.Branch} version:${params.Version} operator:${params.Credential_ID}"
	}

	stage('Update Podspec File') {
		sh "bundle exec fastlane update_podspec zip:${params.Zip} bucket:${params.Bucket} project:${params.Project} branch:${params.Branch} version:${params.Version}"
	}

	stage('Add Tag And Push To Repo') {
		sh "bundle exec fastlane add_and_push_to_repo project:${params.Project} branch:${params.Branch} version:${params.Version} framework:${params.Framework} operator:${params.Credential_ID}"
	}

	stage('Upload Zip File To Minio') {
		sh "bundle exec fastlane upload_zip_file_to_minio project:${params.Project} branch:${params.Branch} version:${params.Version} framework:${params.Framework} zip:${params.Zip} bucket:${params.Bucket}"
	}

	stage('Update Pods Trunk') {
		sh "bundle exec fastlane update_pods_trunk_server project:${params.Project} branch:${params.Branch} version:${params.Version} framework:${params.Framework}"
	}

	stage('Add Comments To Jira') {
		sh "bundle exec fastlane add_comments_to_jira project:${params.Project} branch:${params.Branch} version:${params.Version} framework:${params.Framework} zip:${params.Zip} bucket:${params.Bucket} jira:${params.Jira_Key}"
	}
}

boolean isEmpty(value) { 
	if (value) {
		return false;
	}
	return true;
}

void checkout_target_git(url, branch = 'master', credential_id = '', target_path = '', local_path = null) {
	if (isEmpty(url) || isEmpty(credential_id)) throw new Exception('The required parameters invalid, please check them.');

	if (!local_path) local_path = '.'

	List target_paths = []
	if (target_path) target_paths.add(['path':target_path])

	dir(local_path) {
		checkout([
			$class: 'GitSCM',
			branches: [[name: 'refs/heads/' + branch]],
			doGenerateSubmoduleConfigurations: false,
			extensions: [
				[$class: 'CheckoutOption', timeout: 20],
				[$class: 'CloneOption', depth: 3, noTags: false, reference: '', shallow: true, timeout: 10],
				[$class: 'SparseCheckoutPaths', sparseCheckoutPaths: target_paths]
			],
			userRemoteConfigs: [
				[
					url: url,
					credentialsId: credential_id
				]
			]
		])
	}
}