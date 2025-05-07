pipeline{
    agent any;
    
    stages{
        stage("code"){
            steps{
                git url: "https://github.com/abhihkX8/online_shop_app.git", branch: "dev"
            }
        }
        stage("build"){
            steps{
                sh "docker build -t online-shop ."
            }
        }
        stage('Push to Docker Hub'){
            steps{
              withCredentials([usernamePassword(
                    credentialsId:"dockerhub-credentials",
                    passwordVariable:"dockerHubPass",
                    usernameVariable:"dockerHubUser"
                )]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker image tag online-shop ${env.dockerHubUser}/online-shop"
                sh "docker push ${env.dockerHubuser}/online-shop:latest"
                    
                    
                }
                
                }
            }
        stage("deploy"){
            steps{
                sh " docker compose up -d --build web"
            }
        }
    }
}

