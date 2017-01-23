package hex.state.mock;

#if (!neko || haxe_ver >= "3.3")
import haxe.Timer;
import hex.control.Request;
import hex.control.async.AsyncCommand;

/**
 * ...
 * @author Francis Bourre
 */
class InviteForRegisterMockCommand extends AsyncCommand
{
	@Inject
	public var logger : IMockCommandLogger;

	public function execute( ?request : Request ) : Void
	{
		Timer.delay( this._execute, 50 );
	}
	
	function _execute() : Void
	{
		this.logger.log( "IFR" );
		this._handleComplete();
	}
}
#end