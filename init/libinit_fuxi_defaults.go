package twrp

import (
	"android/soong/android"
	"android/soong/cc"
	"strings"
)

func getTwrpDeviceVars(ctx android.BaseContext, mVar string) string {
	makeVars := ctx.Config().VendorConfig("twrpDeviceVars")
	var makeVar = ""
	if makeVars.IsSet(mVar) {
		makeVar = makeVars.String(mVar)
	}
	return makeVar
}

func globalFlags(ctx android.BaseContext) []string {
	var cflags []string
	var name string = getTwrpDeviceVars(ctx, "TW_RELEASE_DEVICE_NAME")
	if name != "" {
		cflags = append(cflags, "-DTW_RELEASE_DEVICE_" + strings.ToUpper(name))
	}
	return cflags;
}

func libinitPropDefaults(ctx android.LoadHookContext) {
	type props struct {
		Target struct {
			Android struct {
				Cflags  []string
				Enabled *bool
			}
		}
		Cflags       []string
		Srcs         []string
		Include_dirs []string
	}
	p := &props{}
	p.Cflags = globalFlags(ctx)
	ctx.AppendProperties(p)
}

func init() {
	android.RegisterModuleType("libinit_fuxi_defaults", libinitPropDefaultsFactory)
}

func libinitPropDefaultsFactory() android.Module {
	module := cc.DefaultsFactory()
	android.AddLoadHook(module, libinitPropDefaults)
	return module
}
