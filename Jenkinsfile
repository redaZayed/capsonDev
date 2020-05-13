pipeline {
  agent any
  stages {

   stage('Lint') {
      steps {
        sh 'make lint'
      }
   }

   stage('Build & Upload docker image') {
      steps {
         sh 'echo "Build & Run docker image"'
         withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'REDA_DOCKER_HUB',
          usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
            sh '''
                docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                docker build --tag=$DOCKER_USERNAME/udacity-capstone:0.1 .
                docker push $DOCKER_USERNAME/udacity-capstone:0.1
                '''
		}
      }
   }

   stage('Run docker image') {
      steps {
         sh '''
            echo "Build & Run docker image"
            docker run -d -p 6000:5000 redazayed/udacity-capstone:0.1
         '''
      }
   }

   // yankils/simple-DevOps-Project
   stage('Set current kubectl context') {
        steps {
            withAWS(region:'us-east-1', credentials:'social-hub-276013') {
                sh '''
                    kubectl config use-context arn:aws:eks:us-east-1:142977788479:cluster/capstonecluster
                '''
            }
        }
}
//
// 		stage('Deploy blue container') {
// 			steps {
// 				withAWS(region:'us-east-1', credentials:'ecr_credentials') {
// 					sh '''
// 						kubectl apply -f ./blue-controller.json
// 					'''
// 				}
// 			}
// 		}
//
// 		stage('Deploy green container') {
// 			steps {
// 				withAWS(region:'us-east-1', credentials:'ecr_credentials') {
// 					sh '''
// 						kubectl apply -f ./green-controller.json
// 					'''
// 				}
// 			}
// 		}
//
// 		stage('Create the service in the cluster, redirect to blue') {
// 			steps {
// 				withAWS(region:'us-east-1', credentials:'ecr_credentials') {
// 					sh '''
// 						kubectl apply -f ./blue-service.json
// 					'''
// 				}
// 			}
// 		}
//
// 		stage('Wait user approve') {
//             steps {
//                 input "Ready to redirect traffic to green?"
//             }
//         }
//
// 		stage('Create the service in the cluster, redirect to green') {
// 			steps {
// 				withAWS(region:'us-east-1', credentials:'ecr_credentials') {
// 					sh '''
// 						kubectl apply -f ./green-service.json
// 					'''
// 				}
// 			}
// 		}


  }
 }