import React from 'react'
import API from '../../library/API'

import Button from "components/CustomButtons/Button.js";
import { withStyles } from "@material-ui/core/styles";

import GridItem from "components/Grid/GridItem.js";
import GridContainer from "components/Grid/GridContainer.js";
import Card from "components/Card/Card.js";
import CardAvatar from "components/Card/CardAvatar.js";
import CardBody from "components/Card/CardBody.js";
import [+up_singular+]Fields from './[+up_singular+]Fields.js'

import avatar from "assets/img/faces/marc.jpg";

const styles = {};

class [+up_singular+]Show extends React.Component {  
  constructor(props) {
    super(props)

    this.state = this.props.location.state || { [+singular+]: null }

    API.configure(props.token)
  
    if(!this.state.[+singular+]){
      const id = this.props.location.pathname.split("/")[2]
      API.get('[+plural+]', id,
        function(response){
          this.setState({ [+singular+]: response })
        }.bind(this),
        function(error){
          this.props.notifyError(error)
        }.bind(this)
      )
    }
  }
  
  componentDidMount(newProps){
    console.log("this:", this.props.computedMatch);
  }

  onClick(){
    const { id } = this.state.[+singular+]
    this.props.history.push('/[+plural+]/' + id + '/edit', this.state);
  }

  render() {
    const { classes } = this.props
    const { [+singular+] } = this.state
    if(![+singular+]) return null
    
    return (
      <GridContainer>
        <GridItem xs={12} sm={12} md={6}>
          <Card profile>
            <CardAvatar profile>
              <a href="#pablo" onClick={e => e.preventDefault()}>
                <img src={avatar} alt="..." />
              </a>
            </CardAvatar>
            <CardBody profile>
              <[+up_singular+]Fields [+singular+]={[+singular+]} />
              <Button color="primary" onClick={this.onClick.bind(this)} >
                Edit
              </Button>
            </CardBody>
          </Card>
        </GridItem>
      </GridContainer>
    )
  }
}

export default withStyles(styles, { withTheme: true })([+up_singular+]Show);
