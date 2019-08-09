import React from 'react';
import './App.css';
import Navbar from './components/Navbar';
import API from './adapters/API';
// import { BrowserRouter as Router, Route } from 'react-router-dom';
import SignUpForm from './components/SignUpForm'
import LogInForm from './components/LogInForm';
import Dashboard from './components/Dashboard';
import swal from 'sweetalert';
import {Route} from 'react-router-dom';
import {withRouter} from 'react-router-dom'
import Profile from './components/Profile'
import Home from './components/Home'

class App extends React.Component {
  constructor(props)
  {
    super(props)
    this.state = {
      user: undefined,
      data: [],
      // outstandingBills: [],
      // outstandingTasks: []
    }
  }

  componentDidMount() {
    API.validateUser()
      .then(data => {
        if (!data.user) {           
          if (this.props.history.location.pathname === '/signup')
            this.props.history.push(`/signup`)
          else if (this.props.history.location.pathname === '/')
            this.props.history.push(`/login`)
          else
            this.props.history.push(`/login`)
        } else {
          this.setState({ user: data.user })
          this.props.history.push(`/dashboard`)
          API.fetchData().then(data => this.setState({data: data}))
        }}
      )
      // .then(this.outstandingTasks())
  }

  // outstandingBills = () => {
  //   this.state.data.bills.filter(bill => bill.paid === false).setState(this.state.outstandingBills)
  //   console.log(this.state.outstandingBills)
  // }

  // outstandingTasks = () => {
  //   if (this.state.outstandingTasks === undefined){
  //     this.state.data.task.filter(task => task.completed === false).setState(this.state.outstandingTasks)
  //     console.log(this.state.outstandingTasks)}
  //   else 
  //   console.log(this.state.outstandingTasks)
  // }

  ///////// LOGIN/SIGNUP
  signUp = user => {
    API.signUp(user)
      .then(user => this.setState({ user }))
      this.props.history.push(`/dashboard`)
      swal({
        title: "Success!",
        text: "You have signed up!",
        icon: "success",
        timer: 1500,
        buttons: false
        });
  }

  logIn = user => {
    API.logIn(user)
      .then(user => {
        if (user === undefined) {
          console.log('no user')
        } else {
          this.setState({ user })
          API.fetchData().then(data => this.setState({data: data}))
          this.props.history.push(`/dashboard`)
          swal({
          title: "Success!",
          text: "You have logged in!",
          icon: "success",
          timer: 1500,
          buttons: false
          });
        }
      })
  }

  logOut = () => {
    API.clearToken()
    this.setState({ user: undefined, data: [] })
    this.props.history.push(`/login`)
    swal({
      title: "Success!",
      text: "You have logged out!",
      icon: "info",
      timer: 1500,
      buttons: false
      });
  }

  ///////// REDIRECTS
  redirectToDashboard = () => {
    this.props.history.push(`/dashboard`)
  }

  redirectToUserProfile = () => {
    this.props.history.push(`/profile`)
  }

  redirectToHomeProfile = () => {
    this.props.history.push(`/home`)
  }

  ///////// UPDATE - DELETE

  // USER
  updateUser = userNewInfo => {
    API.updateUser(this.state.user, userNewInfo)
    .then(user => this.setState({ user }))
    this.props.history.push(`/dashboard`)
    swal({
      title: "Success!",
      text: "You have changed your details!",
      icon: "success",
      timer: 1500,
      buttons: false
      });
  }

  deleteUser = () => {
    swal({
      title: "Are you sure?",
      text: "Once deleted, you will not be able to recover your profile!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        API.deleteThisUser(this.state.user)
        API.clearToken()
        swal({
          title: "Success!",
          text: "You have deleted your profile!",
          icon: "success",
          timer: 1500,
          buttons: false
          });
          this.props.history.push(`/signup`)
      } else {
        this.props.history.push(`/profile`)
      }
    });
  }

  // HOME
  updateHome = home => {
    console.log(home)
    // API.updateThisHome(this.state.user, home)
    // .then(home => console.log(home))
    // API.fetchData().then(data => this.setState({data: data}))
    // this.props.history.push(`/dashboard`)
    swal({
      title: "Success!",
      text: "You have changed your details!",
      icon: "success",
      timer: 1500,
      buttons: false
      });
  }

  submitNewHomeId = (home) => {
    console.log(home)
    //have to update user home_id
  }

  render() {
    return (
      <div>
        { this.state.user ?
          <div>
            <Route exact path="/dashboard" render={() => 
              <div>
                <Navbar user={this.state.user} logOut={this.logOut} redirectToDashboard={this.redirectToDashboard} redirectToUserProfile={this.redirectToUserProfile}/>
                <Dashboard user={this.state.user} data={this.state.data} redirectToHomeProfile={this.redirectToHomeProfile}/>
              </div>
            } />
            <Route exact path="/profile" render={() => 
              <div>
                <Navbar user={this.state.user} logOut={this.logOut} redirectToDashboard={this.redirectToDashboard} redirectToUserProfile={this.redirectToUserProfile}/>
                <Profile user={this.state.user} submit={this.updateUser} deleteUser={this.deleteUser}/>
              </div>
            } />
            <Route exact path="/home" render={() => 
              <div>
                <Navbar user={this.state.user} logOut={this.logOut} redirectToDashboard={this.redirectToDashboard} redirectToUserProfile={this.redirectToUserProfile}/>
                <Home user={this.state.user} data={this.state.data} submitNewHomeDetails={this.updateHome} submitNewHomeId={this.submitNewHomeId} submitBillUpdate={this.updateHomeBills}/>
              </div>
            } />
          </div>
        :
          <div>
            <Route exact path="/login" render={() => 
              <LogInForm user={this.state.user} submit={this.logIn}/>
            } />
            <Route exact path="/signup" component={() => 
              <SignUpForm submit={this.signUp}/>
            } />
          </div>
        }
      </div>
    )
  }
}

export default withRouter(App);