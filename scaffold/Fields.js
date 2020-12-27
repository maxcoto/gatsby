import React from 'react'
import { withStyles } from "@material-ui/core/styles";
//import avatar from "assets/img/faces/marc.jpg";

const styles = {};

class [+up_singular+]Fields extends React.Component {  
  render() {
    const { classes, [+singular+] } = this.props
    if(![+singular+]) return null

    return (
      <React.Fragment>
        [+show_fields+]
      </React.Fragment>
      
    )
  }
}

export default withStyles(styles, { withTheme: true })([+up_singular+]Fields);
