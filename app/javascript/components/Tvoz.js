import React from "react"
import PropTypes from "prop-types"
class Tvoz extends React.Component {
  render () {
    return (
      <React.Fragment>
        {this.props.comment}

      </React.Fragment>
    );
  }
}

Tvoz.propTypes = {
  comment: PropTypes.string
};
export default Tvoz
