import React from 'react'

// core components
import GridItem from "components/Grid/GridItem.js";
import GridContainer from "components/Grid/GridContainer.js";
import CustomInput from "components/CustomInput/CustomInput.js";
import CustomSelect from "components/CustomSelect/CustomSelect.js";
import CardBody from "components/Card/CardBody.js";

//[++]
//[+import_constants+]
//import { statuses, levels, leadSources, contactMethods } from 'variables/general'

export default class [+up_singular+]Form extends React.Component {
  render() {
    const { [+singular+], onChange } = this.props
    if(![+singular+]) return null
 
    return(
      <CardBody>
        [+edit_fields+]
      </CardBody>
    )
  }
}


